/**
  ******************************************************************************
  * @file    eeprom_test.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing I2C EEPROM.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
//#include <stdio.h>
#include "bsp.h"

/**
  * @addtogroup I2C_EEPROM
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;

/* Private define ------------------------------------------------------------*/
/* Uncomment the following line to enable using LCD screen for messages display */
#define ENABLE_LCD_MSG_DISPLAY

#define sEE_WRITE_ADDRESS1        0x00
#define sEE_READ_ADDRESS1         0x00
#define BUFFER_SIZE1             (countof(Tx1Buffer)-1)
#define BUFFER_SIZE2             (countof(Tx2Buffer)-1)
#define sEE_WRITE_ADDRESS2       (sEE_WRITE_ADDRESS1 + BUFFER_SIZE1)
#define sEE_READ_ADDRESS2        (sEE_READ_ADDRESS1 + BUFFER_SIZE1)

/* Private macro -------------------------------------------------------------*/
#define countof(a) (sizeof(a) / sizeof(*(a)))

/* Private variables ---------------------------------------------------------*/
uint8_t Tx1Buffer[] = "0123";

//"STM8S I2C Firmware Library EEPROM driver example : \
//I2C1 interfacing with 24C02 EEPROM */";

uint8_t Tx2Buffer[] = 
"This firmware provides an example of the I2C firmware library and \
an associate I2C EEPROM driver to communicate with an I2C EEPROM device \
I2C peripheral is configured in Master transmitter during write operation and in\
Master receiver during read operation.";

uint8_t Rx1Buffer[BUFFER_SIZE1], Rx2Buffer[BUFFER_SIZE2]; 
volatile TestStatus TransferStatus1 = FAILED, TransferStatus2 = FAILED;
volatile uint16_t NumDataRead = 0;

/* Private functions ---------------------------------------------------------*/
TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength);

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void eeprom_test(void)
{
  /*!< At this stage the microcontroller clock setting is already configured, 
       this is done through SystemInit() function which is called from startup
       file (startup_stm32f0xx.s) before to branch to application main.
       To reconfigure the default setting of SystemInit() function, refer to
       system_stm32f0xx.c file
     */
  BSP_Init();

  
  char ans = getchar();
    
  printf("\r\nEEPROM Test");
  
  /* Initialize the I2C EEPROM driver ----------------------------------------*/
  EE_Init();  
  
  /* Temporarily Enable Write protect */
  GPIO_WriteLow(EE_I2C_WP_GPIO_PORT, EE_I2C_WP_GPIO_PIN);

  //while(1);
  /* First write in the memory followed by a read of the written data --------*/
  /* Write on I2C EEPROM from sEE_WRITE_ADDRESS1 */
  EE_WriteBuffer(Tx1Buffer, sEE_WRITE_ADDRESS1, BUFFER_SIZE1); 
  printf("\n\rTransfer 1 Ongoing: %u", (unsigned int)BUFFER_SIZE1);
  /* Wait for EEPROM standby state */
  EE_WaitEepromStandbyState();  
  printf("\n\rEEprom Wait standby");
  /* Set the Number of data to be read */
  NumDataRead = BUFFER_SIZE1;
  
  /* Read from I2C EEPROM from sEE_READ_ADDRESS1 */
  EE_ReadBuffer(Rx1Buffer, sEE_READ_ADDRESS1, (uint16_t *)(&NumDataRead)); 
 
  printf("\n\rTX: %s", Tx1Buffer);
  printf("\n\rRX: %s", Rx1Buffer);
  /* Check if the data written to the memory is read correctly */
  TransferStatus1 = Buffercmp(Tx1Buffer, Rx1Buffer, BUFFER_SIZE1);
  /* TransferStatus1 = PASSED, if the transmitted and received data 
     to/from the EEPROM are the same */
  /* TransferStatus1 = FAILED, if the transmitted and received data 
     to/from the EEPROM are different */
  if (TransferStatus1 == PASSED)
  {
    printf("\n\rTransfer 1 PASSED");
  }
  else
  {
    printf("\n\rTransfer 1 FAILED");
  }  

  /* Second write in the memory followed by a read of the written data -------*/
  /* Write on I2C EEPROM from sEE_WRITE_ADDRESS2 */
  EE_WriteBuffer(Tx2Buffer, sEE_WRITE_ADDRESS2, BUFFER_SIZE2); 

  /* Wait for EEPROM standby state */
  EE_WaitEepromStandbyState();  
  
  /* Set the Number of data to be read */
  NumDataRead = BUFFER_SIZE2;  
  
  /* Read from I2C EEPROM from sEE_READ_ADDRESS2 */
  EE_ReadBuffer(Rx2Buffer, sEE_READ_ADDRESS2, (uint16_t *)(&NumDataRead));

  printf("\n\rTransfer 2 Ongoing: %u", (unsigned int)BUFFER_SIZE2);
  printf("\n\rTX: %s", Tx2Buffer);
  printf("\n\rRX: %s", Rx2Buffer);
  
  /* Check if the data written to the memory is read correctly */
  TransferStatus2 = Buffercmp(Tx2Buffer, Rx2Buffer, BUFFER_SIZE2);
  /* TransferStatus2 = PASSED, if the transmitted and received data 
     to/from the EEPROM are the same */
  /* TransferStatus2 = FAILED, if the transmitted and received data 
     to/from the EEPROM are different */
  if (TransferStatus2 == PASSED)
  {
    printf("\n\rTransfer 2 PASSED");
  }
  else
  {
    printf("\n\rTransfer 2 FAILED");
  }  
  
  /* Free all used resources */
  EE_DeInit();

  while (1)
  {
  }
}

#ifndef USE_DEFAULT_TIMEOUT_CALLBACK
/**
  * @brief  Example of timeout situation management.
  * @param  None.
  * @retval None.
  */
uint32_t EE_TIMEOUT_UserCallback(void)
{
  /* Use application may try to recover the communication by resetting I2C
    peripheral (calling the function I2C_SoftwareResetCmd()) then re-start
    the transmission/reception from a previously stored recover point.
    For simplicity reasons, this example only shows a basic way for errors 
    managements which consists of stopping all the process and requiring system
    reset. */
  
  /* Display error message on screen */
  printf("\n\rCommunication ERROR!");
  printf("\n\rTry again after resetting the Board  ");
  
  /* Block communication and all processes */
  while (1)
  {   
  }  
}
#endif /* USE_DEFAULT_TIMEOUT_CALLBACK */

/**
  * @brief  Compares two buffers.
  * @param  pBuffer1, pBuffer2: buffers to be compared.
  * @param  BufferLength: buffer's length
  * @retval PASSED: pBuffer1 identical to pBuffer2
  *         FAILED: pBuffer1 differs from pBuffer2
  */
TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength)
{
  while(BufferLength--)
  {
    if(*pBuffer1 != *pBuffer2)
    {
      return FAILED;
    }
    
    pBuffer1++;
    pBuffer2++;
  }

  return PASSED;  
}
/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
