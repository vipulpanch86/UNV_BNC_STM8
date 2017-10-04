/**
  ******************************************************************************
  * @file    eeprom.h
  * @author  Vipul Panchal
  * @brief   This file contains the eeprom definitions and prototype.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8S_EVAL_I2C_EE_H
#define __STM8S_EVAL_I2C_EE_H

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

/* Exported types ------------------------------------------------------------*/
  
/* Uncomment this line to use the default start and end of critical section 
   callbacks (it disables then enables all interrupts) */
#define USE_DEFAULT_CRITICAL_CALLBACK 
/* Start and End of critical section: these callbacks should be typically used
   to disable interrupts when entering a critical section of I2C communication
   You may use default callbacks provided into this driver by uncommenting the 
   define USE_DEFAULT_CRITICAL_CALLBACK.
   Or you can comment that line and implement these callbacks into your 
   application */

/* Uncomment the following line to use the default EE_TIMEOUT_UserCallback() 
   function implemented in stm8s_eval_i2c_ee.c file.
   EE_TIMEOUT_UserCallback() function is called whenever a timeout condition 
   occurs during communication (waiting on an event that doesn't occur, bus 
   errors, busy devices ...). */   
#define USE_DEFAULT_TIMEOUT_CALLBACK

/* For M24C32 and M24C64 devices, E0,E1 and E2 pins are all used for device 
  address selection (ne need for additional address lines). According to the 
  Hardware connection on the board (on STM8 EVAL board E0 = E1 = E2 = 0) */

#define EE_HW_ADDRESS         0xA0   /* E0 = E1 = E2 = 0 */ 

#define I2C_SPEED             20000
#define I2C_SLAVE_ADDRESS7    0x00

#define EE_PAGESIZE           8
#define EE_ADDRSIZE           1
 
   
/* Maximum Timeout values for flags and events waiting loops. These timeouts are
   not based on accurate values, they just guarantee that the application will 
   not remain stuck if the I2C communication is corrupted.
   You may modify these timeout values depending on CPU frequency and application
   conditions (interrupts routines ...). */   
#define EE_FLAG_TIMEOUT         ((uint32_t)0x1000)
#define EE_LONG_TIMEOUT         ((uint32_t)(10 * EE_FLAG_TIMEOUT))

/* Maximum number of trials for EE_WaitEepromStandbyState() function */
#define EE_MAX_TRIALS_NUMBER     150

#define EE_OK                    0
#define EE_FAIL                  1 

/* Exported macro ------------------------------------------------------------*/ 
void     EE_DeInit(void);
void     EE_Init(void);
uint32_t EE_ReadBuffer(uint8_t* pBuffer, uint16_t ReadAddr, uint16_t* NumByteToRead);
uint32_t EE_WritePage(uint8_t* pBuffer, uint16_t WriteAddr, uint8_t* NumByteToWrite);
void     EE_WriteBuffer(uint8_t* pBuffer, uint16_t WriteAddr, uint16_t NumByteToWrite);
uint32_t EE_WaitEepromStandbyState(void);

/* USER Callbacks: These are functions for which prototypes only are declared in
   EEPROM driver and that should be implemented into user application. */  
/* EE_TIMEOUT_UserCallback() function is called whenever a timeout condition 
   occurs during communication (waiting on an event that doesn't occur, bus 
   errors, busy devices ...).
   You can use the default timeout callback implementation by uncommenting the 
   define USE_DEFAULT_TIMEOUT_CALLBACK in stm8s_eval_i2c_ee.h file.
   Typically the user implementation of this callback should reset I2C peripheral
   and re-initialize communication or in worst case reset all the application. */
uint32_t EE_TIMEOUT_UserCallback(void);

/* Start and End of critical section: these callbacks should be typically used
   to disable interrupts when entering a critical section of I2C communication
   You may use default callbacks provided into this driver by uncommenting the 
   define USE_DEFAULT_CRITICAL_CALLBACK in stm8s_eval_i2c_ee.h file..
   Or you can comment that line and implement these callbacks into your 
   application */
void EE_EnterCriticalSection_UserCallback(void);
void EE_ExitCriticalSection_UserCallback(void);

#endif /* __STM8S_EVAL_I2C_EE_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/