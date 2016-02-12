/**
 * @file sleep.h
 * Sleep module header.
 *
 * This file defines the interface used to manage sleep delays.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */
#ifndef SLEEP_H
#define SLEEP_H

#include <stdint.h>

void nanosleep(uint32_t nanoseconds);
uint32_t usleep(uint32_t useconds);
uint32_t sleep(uint32_t seconds);

#endif // SLEEP_H

