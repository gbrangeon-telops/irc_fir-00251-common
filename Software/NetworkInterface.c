/**
 * @file NetworkInterface.c
 * Network interface module implementation.
 *
 * This file implements the network interface module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "NetworkInterface.h"


netIntfPort_t *NetIntf_FindPort(netIntf_t *netIntf, niPort_t port);
uint32_t NetIntf_GetConnectionIndex(netIntf_t *netIntf, netIntfPort_t *connection);
IRC_Status_t NetIntf_PingHosts(netIntf_t *netIntf);
IRC_Status_t NetIntf_RouteCmd(netIntf_t *netIntf, networkCommand_t *netCmd);
void NetIntf_ShowPacket(netIntf_t *netIntf, networkCommand_t *netCmd);

/**
 * Initializes network interface.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param address is the network address of the network interface.
 * @param txQueue is the pointer to the command queue.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t NetIntf_Init(netIntf_t *netIntf, niAddress_t address, circBuffer_t *cmdQueue)
{
   uint32_t i;

   netIntf->currentState = NIS_INIT;
   netIntf->address = address;
   netIntf->cmdQueue = cmdQueue;
   netIntf->numberOfPorts = 0;
   netIntf->numberOfConnections = 0;
   netIntf->showPackets = 0;

   for (i = 0; i < NI_NUM_OF_HOSTS; i++)
   {
      netIntf->routingTable[i] = NULL;
   }

   return IRC_SUCCESS;
}

/**
 * Connects a network port or a network connection to network interface.
 * The function detects if the specified port is a network port or a network connection
 * based on port value. If the port value is NIP_UNDEFINED, it is connected to the
 * network interface as a network connection. Otherwise, it is connected to the network
 * interface as a network port.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param port is the pointer to the network port or a network connection to connect.
 *
 * @return IRC_SUCCESS if successfully connected.
 * @return IRC_FAILURE if failed to connect.
 */
IRC_Status_t NetIntf_Connect(netIntf_t *netIntf, netIntfPort_t *netIntfPort)
{
   if (netIntfPort->port == NIP_UNDEFINED)
   {
      // Add connection
      if (netIntf->numberOfConnections < NI_MAX_NUM_OF_CONNECTIONS)
      {
         netIntfPort->netIntf = netIntf;
         netIntf->connections[netIntf->numberOfConnections++] = netIntfPort;
      }
      else
      {
         NI_ERR("Cannot add more than %d connections.", NI_MAX_NUM_OF_CONNECTIONS);
         return IRC_FAILURE;
      }
   }
   else
   {
      // Add port
      if (netIntf->numberOfPorts < NI_MAX_NUM_OF_PORTS)
      {
         netIntfPort->netIntf = netIntf;
         netIntf->ports[netIntf->numberOfPorts++] = netIntfPort;
      }
      else
      {
         NI_ERR("Cannot add more than %d ports.", NI_MAX_NUM_OF_PORTS);
         return IRC_FAILURE;
      }
   }

   return IRC_SUCCESS;
}

/**
 * Enqueues network command in network interface circular command buffer.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param netCmd is the network command to enqueue.
 *
 * @return IRC_SUCCESS if successfully enqueued.
 * @return IRC_FAILURE if failed to enqueue.
 */
IRC_Status_t NetIntf_EnqueueCmd(netIntf_t *netIntf, networkCommand_t *netCmd)
{
   netIntfPort_t *p_localPort;

   if (netIntf->showPackets)
   {
      NetIntf_ShowPacket(netIntf, netCmd);
   }

   if ((netCmd->f1f2.destAddr == netIntf->address) && (netCmd->f1f2.destPort != NIP_UNDEFINED))
   {
      // Directly route network command to local port if its command queue is not full
      p_localPort = NetIntf_FindPort(netIntf, netCmd->f1f2.destPort);
      if (p_localPort == NULL)
      {
         NI_ERR("Local port %d not found.", netCmd->f1f2.destPort);
         return IRC_FAILURE;
      }

      if (!CB_Full(p_localPort->cmdQueue))
      {
         return CB_Push(p_localPort->cmdQueue, netCmd);
      }
   }

   return CB_Push(netIntf->cmdQueue, netCmd);
}

/**
 * Flush network interface circular command buffer.
 *
 * @param netIntf is the pointer to the network interface data structure.
 *
 * @return IRC_SUCCESS if successfully flushed command queue.
 * @return IRC_FAILURE if failed to flush command queue.
 */
IRC_Status_t NetIntf_FlushCmdQueue(netIntf_t *netIntf)
{
   CB_Flush(netIntf->cmdQueue);

   return IRC_SUCCESS;
}

/**
 * Network interface state machine.
 *
 * @param netIntf is the pointer to the network interface data structure.
 */
void NetIntf_SM(netIntf_t *netIntf)
{
   networkCommand_t netCmd;
   uint32_t idxHost;
   uint32_t cmdCount;

   // Execute hosts discovery state machine
   switch (netIntf->currentState)
   {
      case NIS_INIT:
         if (NetIntf_PingHosts(netIntf) != IRC_DONE)
         {
            netIntf->retryCount = 0;
            GETTIME(&netIntf->tic_pingStart);
            netIntf->tic_pingTimeout = netIntf->tic_pingStart;
            netIntf->currentState = NIS_WATING_FOR_PING_RESPONSE;
         }
         else
         {
            netIntf->currentState = NIS_READY;
         }
         break;

      case NIS_WATING_FOR_PING_RESPONSE:
         if (elapsed_time_us(netIntf->tic_pingTimeout) > NI_PING_TIMEOUT_US)
         {
            if (netIntf->retryCount < NI_MAX_PING_RETRY)
            {
               if (NetIntf_PingHosts(netIntf) != IRC_DONE)
               {
                  netIntf->retryCount++;
                  GETTIME(&netIntf->tic_pingTimeout);
               }
               else
               {
                  netIntf->currentState = NIS_READY;
               }
            }
            else
            {
               for (idxHost = 0; idxHost < NI_NUM_OF_HOSTS; idxHost++)
               {
                  if (((idxHost + 1) != netIntf->address) && (netIntf->routingTable[idxHost] == NULL))
                  {
                     NI_INF("Host %d cannot be reached after %ds.", (idxHost + 1), (uint32_t)(elapsed_time_us(netIntf->tic_pingStart) / 1000000));
                  }
               }

               netIntf->currentState = NIS_READY;
            }
         }
         break;

      case NIS_READY:
         // Nothing to do
         break;
   }

   // Process command queue
   cmdCount = CB_Length(netIntf->cmdQueue);
   while (cmdCount > 0)
   {
      if (CB_Pop(netIntf->cmdQueue, &netCmd) == IRC_SUCCESS)
      {
         if (netCmd.f1f2.srcAddr == NIA_UNDEFINED)
         {
            NI_INF("srcAddr = NIA_UNDEFINED");
            NetIntf_ShowPacket(netIntf, &netCmd);
         }

         if ((netCmd.f1f2.srcAddr != NIA_UNDEFINED) && (netCmd.f1f2.srcAddr <= NI_NUM_OF_HOSTS) && (netCmd.f1f2.srcAddr != netIntf->address) &&
               (netIntf->routingTable[netCmd.f1f2.srcAddr - 1] == NULL))
         {
            NI_INF("Host %d has been reached after %dms.", netCmd.f1f2.srcAddr, (uint32_t)(elapsed_time_us(netIntf->tic_pingStart) / 1000));
            netIntf->routingTable[netCmd.f1f2.srcAddr - 1] = netCmd.port;
         }

         if (NetIntf_RouteCmd(netIntf, &netCmd) == IRC_NOT_DONE)
         {
            // Push back network command in network interface command queue
            if (CB_Push(netIntf->cmdQueue, &netCmd) != IRC_SUCCESS)
            {
               NI_ERR("Failed to push back command in network interface command queue.");
            }
            else
            {
               NI_DBG("Network command pushed back to network interface command queue.");
            }
         }
      }
      else
      {
         // Unable to pop command from command queue
         break;
      }

      cmdCount--;
   }
}

/**
 * Build broadcast request.
 *
 * @param netIntfPort is the pointer to the network interface port data structure.
 * @param p_request is the pointer to the request command to fill.
 * @param port is the destination broadcast port.
 */
void NetIntf_BuildBroadcastRequest(netIntfPort_t *netIntfPort, F1F2Command_t *p_request, niPort_t port)
{
   p_request->isNetwork = 1;
   p_request->srcAddr = netIntfPort->netIntf->address;
   p_request->srcPort = netIntfPort->port;
   p_request->destAddr = NIA_BROADCAST;
   p_request->destPort = port;
}

/**
 * Find network interface port corresponding to specified port number.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param port is the port number to find.
 *
 * @return Network interface port corresponding to specified port number.
 * @return NULL if the port number cannot be found.
 */
netIntfPort_t *NetIntf_FindPort(netIntf_t *netIntf, niPort_t port)
{
   uint32_t portIndex = 0;

   if ((port == NIP_UNDEFINED) || (port > NI_MAX_NUM_OF_PORTS))
   {
      return NULL;
   }

   while (portIndex < netIntf->numberOfPorts)
   {
      if (netIntf->ports[portIndex]->port == port)
         return netIntf->ports[portIndex];

      ++portIndex;
   }

   return NULL;
}

/**
 * Return network interface connection index corresponding to specified connection.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param connection is the pointer to the connection to find.
 *
 * @return Network interface connection index corresponding to specified connection.
 * @return NI_MAX_NUM_OF_CONNECTIONS if specified connection cannot be found.
 */
uint32_t NetIntf_GetConnectionIndex(netIntf_t *netIntf, netIntfPort_t *connection)
{
   uint32_t connectionIndex = 0;

   while ((connectionIndex < NI_MAX_NUM_OF_CONNECTIONS) &&
         (netIntf->connections[connectionIndex] != connection))
   {
      connectionIndex++;
   }

   return connectionIndex;
}

/**
 * Send network ping command to hosts.
 *
 * @param netIntf is the pointer to the network interface data structure.
 *
 * @return IRC_DONE if all the hosts of the routing table were reached successfully.
 * @return IRC_NOT_DONE if some hosts of the routing table remain not reached.
 */
IRC_Status_t NetIntf_PingHosts(netIntf_t *netIntf)
{
   networkCommand_t netCmd;
   IRC_Status_t status = IRC_DONE;
   uint32_t idxHost;
   uint32_t idxConn;

   if (netIntf->numberOfConnections == 0)
   {
      return IRC_DONE;
   }

   for (idxHost = 0; idxHost < NI_NUM_OF_HOSTS; idxHost++)
   {
      if (((idxHost + 1) != netIntf->address) && (netIntf->routingTable[idxHost] == NULL))
      {
         netCmd.f1f2.isNetwork = 1;
         netCmd.f1f2.srcAddr = netIntf->address;
         netCmd.f1f2.srcPort = NIP_UNDEFINED;
         netCmd.f1f2.destAddr = idxHost + 1;
         netCmd.f1f2.destPort = NIP_UNDEFINED;
         netCmd.f1f2.cmd = F1F2_CMD_PING;
         netCmd.port = NULL;

         // Transmit ping command to every connections
         for (idxConn = 0; idxConn < netIntf->numberOfConnections; idxConn++)
         {
            if (CB_Push(netIntf->connections[idxConn]->cmdQueue, &netCmd) != IRC_SUCCESS)
            {
               NI_ERR("Failed to transmit network ping command to host %d through connection %d.", idxHost + 1, idxConn);
            }
            else
            {
               NI_DBG("Network ping command transmitted to host %d through connection %d.", idxHost + 1, idxConn);
            }
         }

         status = IRC_NOT_DONE;
      }
   }

   return status;
}

/**
 * Route network command to connection(s) and/or local port.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param netCmd is the pointer to the network command to route.
 *
 * @return IRC_SUCCESS if successfully routed network command.
 * @return IRC_FAILURE if failed to route network command.
 * @return IRC_NOT_DONE if failed to route network command due to full command queue.
 */
IRC_Status_t NetIntf_RouteCmd(netIntf_t *netIntf, networkCommand_t *netCmd)
{
   netIntfPort_t *outgoingPortList[NI_MAX_NUM_OF_CONNECTIONS + 1];
   uint32_t outgoingPortCount = 0;
   uint32_t i;
   uint8_t routingError = 0;

   // Determine which connection(s) command must be routed to
   if (netCmd->f1f2.destAddr != netIntf->address)
   {
      if ((netCmd->f1f2.destAddr != NIA_BROADCAST) && ((netCmd->f1f2.destAddr - 1) < NI_NUM_OF_HOSTS) && (netIntf->routingTable[netCmd->f1f2.destAddr - 1] != NULL))
      {
         // Route command to the connection corresponding to the host address in the routing table
         outgoingPortList[outgoingPortCount++] = netIntf->routingTable[netCmd->f1f2.destAddr - 1];
      }
      else
      {
         // Route command to every connections except the one the command comes from
         for (i = 0; i < netIntf->numberOfConnections; i++)
         {
            if (netIntf->connections[i] != netCmd->port)
            {
               outgoingPortList[outgoingPortCount++] = netIntf->connections[i];
            }
         }
      }
   }

   // Determine if command must be routed to local port
   if ((netCmd->f1f2.destPort != NIP_UNDEFINED) &&
         ((netCmd->f1f2.destAddr == netIntf->address) ||
         ((netCmd->f1f2.destAddr == NIA_BROADCAST) && (netCmd->f1f2.srcAddr != netIntf->address))))
   {
      // Find corresponding local port
      outgoingPortList[outgoingPortCount++] = NetIntf_FindPort(netIntf, netCmd->f1f2.destPort);
      if (outgoingPortList[outgoingPortCount - 1] == NULL)
      {
         NI_ERR("Local port %d not found.", netCmd->f1f2.destPort);
         routingError = 1;
      }
   }

   // Check that outgoing port(s) command queue is not full
   for (i = 0; i < outgoingPortCount; i++)
   {
      if (CB_Full(outgoingPortList[i]->cmdQueue))
      {
         if (outgoingPortList[i]->port == NIP_UNDEFINED)
         {
            NI_DBG("Connection %d command queue is full.", NetIntf_GetConnectionIndex(netIntf, outgoingPortList[i]));
         }
         else
         {
            NI_DBG("Local port %d command queue is full.", outgoingPortList[i]->port);
         }
         return IRC_NOT_DONE;
      }
   }

   // Route command to outgoing port(s)
   for (i = 0; i < outgoingPortCount; i++)
   {
      if (CB_Push(outgoingPortList[i]->cmdQueue, netCmd) == IRC_SUCCESS)
      {
         if (outgoingPortList[i]->port == NIP_UNDEFINED)
         {
            NI_DBG("Network command routed to connection %d.", NetIntf_GetConnectionIndex(netIntf, outgoingPortList[i]));
         }
         else
         {
            NI_DBG("Network command routed to local port %d.", outgoingPortList[i]->port);
         }
      }
      else
      {
         if (outgoingPortList[i]->port == NIP_UNDEFINED)
         {
            NI_ERR("Failed to push command in connection %d command queue.", NetIntf_GetConnectionIndex(netIntf, outgoingPortList[i]));
         }
         else
         {
            NI_ERR("Failed to push command in local port %d command queue.", outgoingPortList[i]->port);
         }
         routingError = 1;
      }
   }

   if (routingError == 1)
   {
      return IRC_FAILURE;
   }
   else
   {
      return IRC_SUCCESS;
   }
}

/**
 * Print network packet information.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param netCmd is the pointer to the network command data structure.
 */
void NetIntf_ShowPacket(netIntf_t *netIntf, networkCommand_t *netCmd)
{
   PRINTF("NI: Info: Network command (");

   // Print command data
   switch (netCmd->f1f2.cmd)
   {
      case F1F2_CMD_REG_READ_REQ:
      case F1F2_CMD_REG_READ_RSP:
      case F1F2_CMD_REG_WRITE:
         PRINTF("%s@0x%04X", F1F2_CommandNameToString(netCmd->f1f2.cmd), netCmd->f1f2.payload.regRW.address);
         break;

      case F1F2_CMD_ACK:
      case F1F2_CMD_NAK:
         PRINTF("%s:%s", F1F2_CommandNameToString(netCmd->f1f2.cmd), F1F2_CommandNameToString(netCmd->f1f2.payload.ack.cmd));
         break;
      default:
         PRINTF("%s", F1F2_CommandNameToString(netCmd->f1f2.cmd));
   }

   // Print routing data
   PRINTF(") from ");
   if (netCmd->port->port == NIP_UNDEFINED)
   {
      PRINTF("connection %d", NetIntf_GetConnectionIndex(netIntf, netCmd->port));
   }
   else
   {
      PRINTF("local port %d", netCmd->port->port);
   }
   PRINTF(": src = %d:%d, dest = %d:%d.\n",
         netCmd->f1f2.srcAddr, netCmd->f1f2.srcPort,
         netCmd->f1f2.destAddr, netCmd->f1f2.destPort);
}
