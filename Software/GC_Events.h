/**
 * @file GC_Events.h
 * GenICam events module header.
 *
 * This file defines the GenICam events module interface.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef GC_EVENTS_H
#define GC_EVENTS_H

#include "IRC_Status.h"
#include "GenICam.h"
#include "CircularBuffer.h"

/**
 * GenICam event data structure.
 */
struct gcEventStruct {
   uint32_t code;       /**< GenICam event code */
   uint32_t timestamp;  /**< GenICam event timestamp (POSIX time) */
};

/**
 * GenICam event data type.
 */
typedef struct gcEventStruct gcEvent_t;

IRC_Status_t GC_Events_Init(circBuffer_t *gcEventErrorQueue, circBuffer_t *gcEventTelopsQueue);
IRC_Status_t GC_GenerateEventError(EventErrorCodeDesc_t errcode);
IRC_Status_t GC_GenerateEventTelops(EventTelopsCodeDesc_t eventcode);
void GC_NextEventError();
void GC_NextEventTelops();

#endif // GC_EVENTS_H
