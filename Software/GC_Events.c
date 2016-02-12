/**
 * @file GC_Events.c
 * GenICam events module implementation.
 *
 * This file implements the GenICam events module.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */
 
#include "GC_Events.h"
#include "GC_Registers.h"

static IRC_Status_t GC_GenerateEvent(EventSelector_t eventSelector, uint32_t eventCode, circBuffer_t *eventQueue);

circBuffer_t *gcEventErrorQueue;
circBuffer_t *gcEventTelopsQueue;


/**
 * Initialize GenICam event module.
 *
 * @param gcEventErrorQueue is the GenICam error event queue pointer.
 * @param gcEventTelopsQueue is the GenICam Telops event queue pointer.
 *
 * @return IRC_SUCCESS if the GenICam events module was successfully initialized.
 * @return IRC_FAILURE if failed to initialize the GenICam event module.
 */
IRC_Status_t GC_Events_Init(circBuffer_t *p_gcEventErrorQueue, circBuffer_t *p_gcEventTelopsQueue)
{
   gcEventErrorQueue = p_gcEventErrorQueue;
   gcEventTelopsQueue = p_gcEventTelopsQueue;

   return IRC_SUCCESS;
}

/**
 * Generate GenICam error event.
 *
 * @param eventCode is the GenICam error event code to be generated.
 *
 * @return IRC_SUCCESS if the GenICam error event was successfully generated.
 * @return IRC_FAILURE if the GenICam error event cannot be generated.
 */
IRC_Status_t GC_GenerateEventError(EventErrorCodeDesc_t eventCode)
{
   if (GC_GenerateEvent(ES_Error, eventCode, gcEventErrorQueue) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   GC_NextEventError();

   return IRC_SUCCESS;
}

/**
 * Generate GenICam Telops event.
 *
 * @param eventCode is the GenICam Telops event code to be generated.
 *
 * @return IRC_SUCCESS if the GenICam Telops event was successfully generated.
 * @return IRC_FAILURE if the GenICam Telops event cannot be generated.
 */
IRC_Status_t GC_GenerateEventTelops(EventTelopsCodeDesc_t eventCode)
{
   if (GC_GenerateEvent(ES_Telops, eventCode, gcEventTelopsQueue) != IRC_SUCCESS)
   {
      return IRC_FAILURE;
   }

   GC_NextEventTelops();

   return IRC_SUCCESS;
}

/**
 * Pop next error event from error event queue.
 */
void GC_NextEventError()
{
   gcEvent_t event;

   if (gcEventErrorQueue == NULL)
   {
      return;
   }

   if ((gcRegsData.EventError == 0) && (gcRegsData.EventErrorCode == EECD_NoError) &&
         (gcRegsData.EventErrorTimestamp == 0) && (CB_Pop(gcEventErrorQueue, &event) == IRC_SUCCESS))
   {
      gcRegsData.EventErrorCode = event.code;
      gcRegsData.EventErrorTimestamp = event.timestamp;
      gcRegsData.EventError = 1;
   }
}

/**
 * Pop next Telops event from Telops event queue.
 */
void GC_NextEventTelops()
{
   gcEvent_t event;

   if (gcEventTelopsQueue == NULL)
   {
      return;
   }

   if ((gcRegsData.EventTelops == 0) && (gcRegsData.EventTelopsCode == ETCD_NoEvent) &&
         (gcRegsData.EventTelopsTimestamp == 0) && (CB_Pop(gcEventTelopsQueue, &event) == IRC_SUCCESS))
   {
      gcRegsData.EventTelopsCode = event.code;
      gcRegsData.EventTelopsTimestamp = event.timestamp;
      gcRegsData.EventTelops = 1;
   }
}

/**
 * Generate GenICam event.
 * This function generates time stamped GenICam event.
 *
 * @param eventSelector is the GenICam event selector.
 * @param eventCode is the GenICam event code to be generated.
 * @param eventQueue is the GenICam event queue pointer.
 *
 * @return IRC_SUCCESS if the GenICam event was successfully generated.
 * @return IRC_FAILURE if the GenICam event cannot be generated.
 */
IRC_Status_t GC_GenerateEvent(EventSelector_t eventSelector, uint32_t eventCode, circBuffer_t *eventQueue)
{
   gcEvent_t event;

   // Validate event queue pointer
   if (eventQueue == NULL)
   {
      GC_ERR("Invalid event queue pointer.");
      return IRC_FAILURE;
   }

   // Validate that this type of event is enabled
   if (EventNotificationAry[eventSelector] == EN_Off)
   {
      GC_ERR("%s NOT generated because events are disabled (Code = %d).", (eventSelector == ES_Error)? "Error" : "Event", eventCode);
      return IRC_FAILURE;
   }

   event.code = eventCode;
   event.timestamp = GC_GetTimestamp();

   // Push event into event queue
   if (CB_Push(eventQueue, &event) != IRC_SUCCESS)
   {
      GC_ERR("%s NOT generated because event queue is full (Code = %d).", (eventSelector == ES_Error)? "Error" : "Event", eventCode);
      return IRC_FAILURE;
   }

   PRINTF("GenICam %s has been generated (Code = %d)\n", (eventSelector == ES_Error)? "error" : "event", eventCode);

   return IRC_SUCCESS;
}
