/**
 * @file BuiltInTests.h
 * Built-in tests module header.
 *
 * This file defines the built-in tests module interface.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef BUILTINTESTS_H
#define BUILTINTESTS_H

#include "IRC_Status.h"
#include "GenICam.h"
#include "BuiltInTestsDef.h"
#include <stdint.h>

#define BIT_NUM_OF_RESULTS_IN_REG   16


/**
 * Built-in test ID data type.
 */
typedef enum builtInTestIDEnum builtInTestID_t;

/**
 * Built-in test result.
 */
enum builtInTestResultEnum {
   BITR_NotApplicable = DBITGR_NotApplicable,
   BITR_Pending = DBITGR_Pending,
   BITR_Passed = DBITGR_Passed,
   BITR_Failed = DBITGR_Failed
};

/**
 * Built-in test result data type.
 */
typedef enum builtInTestResultEnum builtInTestResult_t;

/**
 * Built-in test function pointer data type.
 */
typedef IRC_Status_t (*builtInTestFunc_t)();

/**
 * Built-in test data structure declaration.
 */
struct BuiltInTestStruct {
   builtInTestID_t id;           /**< Built-in test ID */
   char *description;            /**< Built-in test description */
   builtInTestFunc_t testFunc;   /**< Built-in test function */
   builtInTestResult_t result;   /**< Built-in test result */
};

/**
 * Built-in test data type.
 */
typedef struct BuiltInTestStruct builtInTest_t;


extern builtInTest_t builtInTests[BITID_Count];


IRC_Status_t BuiltInTest_UpdateGlobalResult();
IRC_Status_t BuiltInTest_Check();
void BuiltInTest_Execute(builtInTestID_t builtInTestID);
uint32_t BuiltInTest_FillResultRegister(uint32_t regOffset);

#endif // BUILTINTESTS_H
