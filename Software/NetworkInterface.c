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
IRC_Status_t NetIntf_PingHosts(netIntf_t *netIntf);
IRC_Status_t NetIntf_ProcessCmd(netIntf_t *netIntf, networkCommand_t *netCmd);

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
   return CB_Push(netIntf->cmdQueue, netCmd);
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
         if (netIntf->showPackets)
         {
            NI_INF("Network command from local port %d: src = %d:%d, dest = %d:%d.",
                  netCmd.port->port, netCmd.f1f2.srcAddr, netCmd.f1f2.srcPort, netCmd.f1f2.destAddr, netCmd.f1f2.destPort);
         }

         if ((netCmd.f1f2.srcAddr != netIntf->address) && ((netCmd.f1f2.srcAddr - 1) < NI_NUM_OF_HOSTS) && (netIntf->routingTable[netCmd.f1f2.srcAddr - 1] == NULL))
         {
            NI_INF("Host %d has been reached after %dms.", netCmd.f1f2.srcAddr, (uint32_t)(elapsed_time_us(netIntf->tic_pingStart) / 1000));
            netIntf->routingTable[netCmd.f1f2.srcAddr - 1] = netCmd.port;
         }

         NetIntf_ProcessCmd(netIntf, &netCmd);
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
 * Build network response to the specified request.
 *
 * @param p_request is the pointer to the request command.
 * @param p_response is the pointer to the response command to fill.
 */
void NetIntf_BuildNetworkResponse(F1F2Command_t *p_request, F1F2Command_t *p_response)
{
   uint8_t destAddr;
   uint8_t destPort;

   if (p_request->isNetwork == 1)
   {
      // Save request destination address and port in case p_response = p_request
      destAddr = p_request->destAddr;
      destPort = p_request->destPort;

      p_request->isNetwork = 1;
      p_response->destAddr = p_request->srcAddr;
      p_response->destPort = p_request->srcPort;
      p_response->srcAddr = destAddr;
      p_response->srcPort = destPort;
   }
   else
   {
      p_request->isNetwork = 0;
      p_response->destAddr = NIA_UNDEFINED;
      p_response->destPort = NIP_UNDEFINED;
      p_response->srcAddr = NIA_UNDEFINED;
      p_response->srcPort = NIP_UNDEFINED;
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

   NI_ERR("Local port %d not found.", port);

   return NULL;
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
 * Process network command.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param netCmd is the pointer to the network command to process.
 *
 * @return IRC_SUCCESS if successfully processed network command.
 * @return IRC_FAILURE if failed to process network command.
 */
IRC_Status_t NetIntf_ProcessCmd(netIntf_t *netIntf, networkCommand_t *netCmd)
{
   netIntfPort_t *netIntfPort;
   uint32_t i;

   if ((netCmd->f1f2.destAddr == netIntf->address) ||
         ((netCmd->f1f2.destAddr == NIA_BROADCAST) && (netCmd->f1f2.srcAddr != netIntf->address)))
   {
      // Transmit command to local port
      netIntfPort = NetIntf_FindPort(netIntf, netCmd->f1f2.destPort);
      if (netIntfPort != NULL)
      {
         if (CB_Push(netIntfPort->cmdQueue, netCmd) != IRC_SUCCESS)
         {
            NI_DBG("Failed to push command in port %d command queue.", netIntfPort->port);

            // Push back network command in network interface command queue
            if (CB_Push(netIntf->cmdQueue, netCmd) != IRC_SUCCESS)
            {
               NI_ERR("Failed to push back command in network interface command queue.");
            }
            else
            {
               NI_DBG("Network command pushed back to network interface command queue.");
            }
         }
         else
         {
            NI_DBG("Network command forwarded to local port %d.", netIntfPort->port);
         }
      }
   }

   if (netCmd->f1f2.destAddr != netIntf->address)
   {
      if ((netCmd->f1f2.destAddr != NIA_BROADCAST) && ((netCmd->f1f2.destAddr - 1) < NI_NUM_OF_HOSTS) && (netIntf->routingTable[netCmd->f1f2.destAddr - 1] != NULL))
      {
         // Transmit command to the connection corresponding to the host address in the routing table
         if (CB_Push(netIntf->routingTable[netCmd->f1f2.destAddr - 1]->cmdQueue, netCmd) != IRC_SUCCESS)
         {
            NI_DBG("Failed to transmit network command.");

            // Push back network command in network interface command queue
            if (CB_Push(netIntf->cmdQueue, netCmd) != IRC_SUCCESS)
            {
               NI_ERR("Failed to push back command in network interface command queue.");
            }
            else
            {
               NI_DBG("Network command pushed back to network interface command queue.");
            }
         }
         else
         {
            NI_DBG("Network command transmitted.");
         }
      }
      else
      {
         // Transmit command to every connections except the one the command comes from
         for (i = 0; i < netIntf->numberOfConnections; i++)
         {
            if (netCmd->port != netIntf->connections[i])
            {
               if (CB_Push(netIntf->connections[i]->cmdQueue, netCmd) != IRC_SUCCESS)
               {
                  NI_ERR("Failed to transmit network command through connection %d.", i);
               }
               else
               {
                  NI_DBG("Network command transmitted through connection %d.", i);
               }
            }
         }
      }
   }

   return IRC_SUCCESS;
}
