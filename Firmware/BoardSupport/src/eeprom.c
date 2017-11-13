/**
  ******************************************************************************
  * @file    stm8s_eval_i2c_ee.c
  * @author  MCD Application Team
  * @version V1.0.1
  * @date    30-September-2014
  * @brief   This file provides a set of functions needed to manage the I2C M24CXX
  *          EEPROM memory mounted on STM8Sxx-EVAL board (refer to stm8s_eval.h
  *          to know about the boards supporting this memory).
  *          
  *          ===================================================================      
  *          Note: This driver is intended for STM8S families devices only.
  *          ===================================================================
  *                        
  *          It implements a high level communication layer for read and write
  *          from/to this memory. The needed STM8S hardware resources (I2C and
  *          GPIO) are defined in stm8s_eval.h file, and the initialization is
  *          performed in EE_LowLevel_Init() function declared in stm8s_eval.c
  *          file.
  *          You can easily tailor this driver to any other development board,
  *          by just adapting the defines for hardware resources and
  *          EE_LowLevel_Init() function.
  *
  *          @note In this driver, basic read and write functions (EE_ReadBuffer()
  *                and EE_WritePage()) use the I2C in polling mode to perform 
  *                the data transfer to/from EEPROM memory 
  *                Safe procedure is implemented to handle the read operation, 
  *                ensuring safe data reception in case of 1, 2, 3 or more bytes
  *                The application should then monitor the variable holding
  *                the number of data in order to determine when the transfer is
  *                completed (variable decremented to 0). 
  *                For more details on the use of this driver you can refer to 
  *                the I2C_EEPROM example provided within the STM8SS_StdPeriph_Lib 
  *                package.      
  *
  *     +-----------------------------------------------------------------+
  *     |                        Pin assignment                           |
  *     +---------------------------------------+-----------+-------------+
  *     |  STM8S I2C Pins                       |   EE     |   Pin       |
  *     +---------------------------------------+-----------+-------------+
  *     | .                                     |   E0(GND) |    1  (0V)  |
  *     | .                                     |   E1(GND) |    2  (0V)  |
  *     | .                                     |   E2(GND) |    3  (0V)  |
  *     | .                                     |   E0(VSS) |    4  (0V)  |
  *     | EE_I2C_SDA_PIN/ SDA                  |   SDA     |    5        |
  *     | EE_I2C_SCL_PIN/ SCL                  |   SCL     |    6        |
  *     | .                                     |   /WC(VDD)|    7 (3.3V) |
  *     | .                                     |   VDD     |    8 (3.3V) |
  *     +---------------------------------------+-----------+-------------+
  ******************************************************************************
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "eeprom.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup STM8S_EVAL
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup STM8S_EVAL_I2C_EE
  * @brief      This file includes the I2C EEPROM driver of STM8S-EVAL boards.
  * @{
  */

/* Private types -------------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/

/** @defgroup STM8S_EVAL_I2C_EE_Private_Variables
  * @{
  */
__IO uint16_t  EEAddress = 0;   
__IO uint32_t  EETimeout = EE_LONG_TIMEOUT;   
__IO uint8_t*  EEDataWritePointer;  
__IO uint8_t   EEDataNum;
/**
  * @}
  */

/* Private function prototypes -----------------------------------------------*/


/** @defgroup STM8S_EVAL_I2C_EE_Private_Functions
  * @{
  */

/**
  * @brief  DeInitializes peripherals used by the I2C EEPROM driver.
  * @param  None
  * @retval None
  */
void EE_DeInit(void)
{
  BSP_EepromDeInit(); 
}

/**
  * @brief  Initializes peripherals used by the I2C EEPROM driver.
  * @param  None
  * @retval None
  */
void EE_Init(void)
{
  BSP_EepromInit();

  /* I2C configuration */
  /* EE_I2C Peripheral Enable */
  I2C_Cmd( ENABLE);
  I2C_SoftwareResetCmd(ENABLE);
  /* EE_I2C configuration after enabling it */
  I2C_Init(I2C_SPEED, I2C_SLAVE_ADDRESS7, I2C_DUTYCYCLE_2, I2C_ACK_CURR, 
           I2C_ADDMODE_7BIT, 16);

  /* Select the EEPROM address according to the state of E0, E1, E2 pins */
  EEAddress = EE_HW_ADDRESS;
}

/**
  * @brief  Reads a block of data from the EEPROM.
  * @param  pBuffer : pointer to the buffer that receives the data read from 
  *         the EEPROM.
  * @param  ReadAddr : EEPROM's internal address to start reading from.
  * @param  NumByteToRead : pointer to the variable holding number of bytes to 
  *         be read from the EEPROM.
  * 
  *        @note The variable pointed by NumByteToRead is reset to 0 when all the 
  *              data are read from the EEPROM. Application should monitor this 
  *              variable in order to know when the transfer is complete.
  * 
  * @note This function ensures data reading from EEPROM, it assumes that I2C is 
  *       used with polling or its interrupt priority is not the highest in the 
  *       application. 
  *       Method 2 transfer sequence is implemented in this function(refer to RM0016
  *       for more details). 3 bytes, 2bytes and 1 byte reception cases are handled.           
  * 
  * @retval EE_OK (0) if operation is correctly performed, else return value 
  *         different from EE_OK (0) or the timeout user callback.
  */
uint32_t EE_ReadBuffer(uint8_t* pBuffer, uint16_t ReadAddr, uint16_t* NumByteToRead)
{
  printf("\n\rEE_ReadBuffer - Entry");

  /* While the bus is busy */
  EETimeout = EE_LONG_TIMEOUT;
  while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C not busy");

  /* Send START condition */
  I2C_GenerateSTART(ENABLE);

  /* Test on EV5 and clear it (cleared by reading SR1 then writing to DR) */
  EETimeout = EE_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C master mode selected");

  /* Send EEPROM address for write */
  I2C_Send7bitAddress( (uint8_t)EEAddress, I2C_DIRECTION_TX);

  /* Test on EV6 and clear it */
  EETimeout = EE_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  } 
  printf("\n\rI2C master transmit mode selected");

#if (EE_ADDRSIZE == 2)

  /* Send the EEPROM's internal address to read from: MSB of the address first */
  I2C_SendData( (uint8_t)((ReadAddr & 0xFF00) >> 8));    

  /* Test on EV8 and clear it */
  EETimeout = EE_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C master MSB transmitted");
  
#endif /* EE_ADDRSIZE  == 2 */

  /* Send the EEPROM's internal address to read from: LSB of the address */
  I2C_SendData( (uint8_t)(ReadAddr & 0x00FF));    

  /* Test on EV8 and clear it */
  EETimeout = EE_FLAG_TIMEOUT;
  while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET)
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C master LSB transmitted");
  
  /* Send START condition a second time */  
  I2C_GenerateSTART( ENABLE);
  
  /* Test on EV5 and clear it (cleared by reading SR1 then writing to DR) */
  EETimeout = EE_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  } 
  printf("\n\rI2C master mode selected");
  
  /* Send EEPROM address for read */
  I2C_Send7bitAddress((uint8_t)EEAddress, I2C_DIRECTION_RX);

  /* Test on EV6 and clear it */
  EETimeout = EE_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C master receiver mode Selected");
  
  /* Read data from first byte until byte N-3 */
  if ((uint16_t)(*NumByteToRead)> 3) 
    {
      /* Poll on BTF */
      EETimeout = EE_FLAG_TIMEOUT;
      while (I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED) == RESET)
      {
        if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
      } 

      /* Read a byte from the EEPROM */
      *pBuffer = I2C_ReceiveData();

      /* Point to the next location where the byte read will be saved */
      *pBuffer++;

      /* Decrement the read bytes counter */
      (uint16_t)(*NumByteToRead)--;
    }

  /*  Remains three data for read: data N-2, data N-1, Data N */
  /* Three Bytes Master Reception procedure (POLLING) ------------------------*/
  if ((uint16_t)(*NumByteToRead) == 3)  
  {
    /* Data N-2 in DR and data N -1 in shift register */
    /* Poll on BTF */
      EETimeout = EE_FLAG_TIMEOUT;
      while (I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED) == RESET)
      {
        if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
      } 

      /* Clear ACK */
      I2C_AcknowledgeConfig(I2C_ACK_NONE);

      /* Call User callback for critical section start (should typically disable interrupts) */
      EE_EnterCriticalSection_UserCallback();

      /* Read Data N-2 */
      *pBuffer = I2C_ReceiveData();

      /* Point to the next location where the byte read will be saved */
      *pBuffer++;

      /* Program the STOP */
      I2C_GenerateSTOP(ENABLE);

      /* Read DataN-1 */
      *pBuffer = I2C_ReceiveData();

       /* Call User callback for critical section end (should typically re-enable interrupts) */
       EE_ExitCriticalSection_UserCallback();

      /* Point to the next location where the byte read will be saved */
      *pBuffer++;

      /* Poll on RxNE */
      EETimeout = EE_FLAG_TIMEOUT;
      while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET)
      {
        if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
      }
      /* Read DataN */
      *pBuffer = I2C_ReceiveData();

      /* Reset the number of bytes to be read from the EEPROM */
      NumByteToRead = 0;

    }
  
  /* If number of data to be read is 2 */
  /* Tow Bytes Master Reception procedure (POLLING) ---------------------------*/
  if ((uint16_t)(*NumByteToRead) == 2)
  {
    /* Enable acknowledgement on next byte (set POS and ACK bits)*/
    I2C_AcknowledgeConfig(I2C_ACK_NEXT);
    
    /* Wait on ADDR flag to be set (ADDR is still not cleared at this level */
    EETimeout = EE_FLAG_TIMEOUT;
    while(I2C_GetFlagStatus( I2C_FLAG_ADDRESSSENTMATCHED) == RESET)
    {
      if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
    }
    
    /* Clear ADDR register by reading SR1 then SR3 register (SR1 has already been read) */
     (void)I2C->SR3;
        
    /* Disable Acknowledgement */
    I2C_AcknowledgeConfig(I2C_ACK_NONE);
    
    /* Wait for BTF flag to be set */
      EETimeout = EE_FLAG_TIMEOUT;
      while (I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED) == RESET)
      {
        if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
      } 
    
    /* Call User callback for critical section start (should typically disable interrupts) */
    EE_EnterCriticalSection_UserCallback();
    
    /* Program the STOP */
      I2C_GenerateSTOP(ENABLE);
      
    /* Read Data N-1 */
      *pBuffer = I2C_ReceiveData();

      /* Point to the next location where the byte read will be saved */
      *pBuffer++;  
           
    /* Call User callback for critical section end (should typically re-enable interrupts) */
       EE_ExitCriticalSection_UserCallback();
       
    /* Read Data N */
      *pBuffer = I2C_ReceiveData();
          
    /* Reset the number of bytes to be read from the EEPROM */
      NumByteToRead = 0;   
  }
  
  /* If number of data to be read is 1 */
  /* One Byte Master Reception procedure (POLLING) ---------------------------*/
  if ((uint16_t)(*NumByteToRead) < 2)
  {
    /* Wait on ADDR flag to be set (ADDR is still not cleared at this level */
    EETimeout = EE_FLAG_TIMEOUT;
    while(I2C_GetFlagStatus( I2C_FLAG_ADDRESSSENTMATCHED) == RESET)
    {
      if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
    } 
       
    /* Disable Acknowledgement */
    I2C_AcknowledgeConfig(I2C_ACK_NONE);   

    /* Call User callback for critical section start (should typically disable interrupts) */
    EE_EnterCriticalSection_UserCallback();
    
    /* Clear ADDR register by reading SR1 then SR3 register (SR1 has already been read) */
    (void)EE_I2C->SR3;
    
    /* Send STOP Condition */
    I2C_GenerateSTOP( ENABLE);
   
    /* Call User callback for critical section end (should typically re-enable interrupts) */
    EE_ExitCriticalSection_UserCallback();
    
    /* Wait for the byte to be received */
    EETimeout = EE_FLAG_TIMEOUT;
    while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET)
    {
      if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
    }
    
    /* Read the byte received from the EEPROM */
    *pBuffer = I2C_ReceiveData();
    
    /* Decrement the read bytes counter */
    (uint16_t)(*NumByteToRead)--;        
    
    /* Wait to make sure that STOP control bit has been cleared */
    EETimeout = EE_FLAG_TIMEOUT;
    while(EE_I2C->CR2 & I2C_CR2_STOP)
    {
      if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
    }  
    
    /* Re-Enable Acknowledgement to be ready for another reception */
    I2C_AcknowledgeConfig( I2C_ACK_CURR);    
  }
  /* If all operations OK, return EE_OK (0) */
  return EE_OK;  
}

/**
  * @brief  Writes buffer of data to the I2C EEPROM.
  * @param  pBuffer : pointer to the buffer  containing the data to be written
  *         to the EEPROM.
  * @param  WriteAddr : EEPROM's internal address to write to.
  * @param  NumByteToWrite : number of bytes to write to the EEPROM.
  * @retval None
  */
void EE_WriteBuffer(uint8_t* pBuffer, uint16_t WriteAddr, uint16_t NumByteToWrite)
{
  uint8_t NumOfPage = 0, NumOfSingle = 0, count = 0;
  uint16_t Addr = 0;

  Addr = WriteAddr % EE_PAGESIZE;
  count = (uint8_t)(EE_PAGESIZE - (uint16_t)Addr);
  NumOfPage =  (uint8_t)(NumByteToWrite / EE_PAGESIZE);
  NumOfSingle = (uint8_t)(NumByteToWrite % EE_PAGESIZE);

  /* If WriteAddr is EE_PAGESIZE aligned  */
  if (Addr == 0)
  {
    /* If NumByteToWrite < EE_PAGESIZE */
    if (NumOfPage == 0)
    {
      /* Store the number of data to be written */
      EEDataNum = NumOfSingle;
      /* Start writing data */
      EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
      /* Wait data transfer to be complete */
      EETimeout = EE_LONG_TIMEOUT;
      while (EEDataNum > 0)
      {
        if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
      }
      EE_WaitEepromStandbyState();
    }
    /* If NumByteToWrite > EE_PAGESIZE */
    else
    {
      while (NumOfPage--)
      {
        /* Store the number of data to be written */
        EEDataNum = EE_PAGESIZE;
        EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        }
        EE_WaitEepromStandbyState();
        WriteAddr +=  EE_PAGESIZE;
        pBuffer += EE_PAGESIZE;
      }

      if (NumOfSingle != 0)
      {
        /* Store the number of data to be written */
        EEDataNum = NumOfSingle;
        EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        }
        EE_WaitEepromStandbyState();
      }
    }
  }
  /* If WriteAddr is not EE_PAGESIZE aligned  */
  else
  {
    /* If NumByteToWrite < EE_PAGESIZE */
    if (NumOfPage == 0)
    {
      /* If the number of data to be written is more than the remaining space
      in the current page: */
      if (NumByteToWrite > count)
      {
        /* Store the number of data to be written */
        EEDataNum = count;
        /* Write the data contained in the same page */
        EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        }
        EE_WaitEepromStandbyState();

        /* Store the number of data to be written */
        EEDataNum = (uint8_t)(NumByteToWrite - count);
        /* Write the remaining data in the following page */
        EE_WritePage((uint8_t*)(pBuffer + count), (WriteAddr + count), (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        }     
        EE_WaitEepromStandbyState();
      }
      else
      {
        /* Store the number of data to be written */
        EEDataNum = NumOfSingle;
        EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        }
        EE_WaitEepromStandbyState();
      }
    }
    /* If NumByteToWrite > EE_PAGESIZE */
    else
    {
      NumByteToWrite -= count;
      NumOfPage = (uint8_t)(NumByteToWrite / EE_PAGESIZE);
      NumOfSingle = (uint8_t)(NumByteToWrite % EE_PAGESIZE);

      if (count != 0)
      {
        /* Store the number of data to be written */
        EEDataNum = count;
        EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        }
        EE_WaitEepromStandbyState();
        WriteAddr += count;
        pBuffer += count;
      }

      while (NumOfPage--)
      {
        /* Store the number of data to be written */
        EEDataNum = EE_PAGESIZE;
        EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        } 
        EE_WaitEepromStandbyState();
        WriteAddr +=  EE_PAGESIZE;
        pBuffer += EE_PAGESIZE;
      }
      if (NumOfSingle != 0)
      {
        /* Store the number of data to be written */
        EEDataNum = NumOfSingle;
        EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
        /* Wait data transfer to be complete */
        EETimeout = EE_LONG_TIMEOUT;
        while (EEDataNum > 0)
        {
          if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
        }
        EE_WaitEepromStandbyState();
      }
    }
  }
}

/**
  * @brief  Writes more than one byte to the EEPROM.
  *   
  * @note   The number of bytes (combined to write start address) must not 
  *         cross the EEPROM page boundary. This function can only write into
  *         the boundaries of an EEPROM page.
  *         This function doesn't check on boundaries condition (in this driver 
  *         the function EE_WriteBuffer() which calls EE_WritePage() is 
  *         responsible of checking on Page boundaries).
  * 
  * @param  pBuffer : pointer to the buffer containing the data to be written to 
  *         the EEPROM.
  * @param  WriteAddr : EEPROM's internal address to write to.
  * @param  NumByteToWrite : pointer to the variable holding number of bytes to 
  *         be written into the EEPROM. 
  * 
  *        @note The variable pointed by NumByteToWrite is reset to 0 when all the 
  *              data are written to the EEPROM. Application should monitor this 
  *              variable in order know when the transfer is complete.
  *
  * @retval EE_OK (0) if operation is correctly performed, else return value 
  *         different from EE_OK (0) or the timeout user callback.
  */
uint32_t EE_WritePage(uint8_t* pBuffer, uint16_t WriteAddr, uint8_t* NumByteToWrite)
{
  /* Set the pointer to the Number of data to be written. 
     User should check on this variable in order to know if the 
      data transfer has been completed or not. */
  EEDataWritePointer = NumByteToWrite;  
  printf("\n\rEE_WritePage - Entry");
  /* While the bus is busy */
  EETimeout = EE_LONG_TIMEOUT;
  while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C Not Busy");
  /* Send START condition */
  I2C_GenerateSTART( ENABLE);
  printf("\n\rI2C Start Sent");
  
  /* Test on EV5 and clear it */
  EETimeout = EE_FLAG_TIMEOUT;
  while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C master mode Selected");
  
  /* Send EEPROM address for write */
  EETimeout = EE_FLAG_TIMEOUT;
  I2C_Send7bitAddress((uint8_t)EEAddress, I2C_DIRECTION_TX);
  printf("\n\rI2C Slave Address 0x%x Sent", (int)EEAddress);

  /* Test on EV6 and clear it */
  EETimeout = EE_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  printf("\n\rI2C master transmit mode Selected");

#if (EE_ADDRSIZE  == 2)
  
  /* Send the EEPROM's internal address to write to : MSB of the address first */
  I2C_SendData( (uint8_t)((WriteAddr & 0xFF00) >> 8));

  /* Test on EV8 and clear it */
  EETimeout = EE_FLAG_TIMEOUT;  
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }  
#endif /* EE_ADDRSIZE  == 2 */

  /* Send the EEPROM's internal address to write to : LSB of the address */
  I2C_SendData( (uint8_t)(WriteAddr & 0x00FF));
  
  /* Test on EV8 and clear it */
  EETimeout = EE_FLAG_TIMEOUT; 
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  
  /* While there is data to be written */
  while((uint16_t)(*EEDataWritePointer) > 0)
  {
    /* Send the byte to be written */
    I2C_SendData( *pBuffer);

    /* Test on EV8 and clear it */
    /* Wait till all data have been physically transferred on the bus */
    EETimeout = EE_LONG_TIMEOUT;
    while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED))
    {
      if((EETimeout--) == 0) EE_TIMEOUT_UserCallback();
    }
    (uint16_t)(*EEDataWritePointer)--;
  }
  
   /* Send STOP condition */
    I2C_GenerateSTOP(ENABLE);
    
    /* Perform a read on SR1 and SR3 register to clear eventually pending flags */
    (void)EE_I2C->SR1;
    (void)EE_I2C->SR3;

  /* If all operations OK, return EE_OK (0) */
  return EE_OK;  
}

/**
  * @brief  Wait for EEPROM Standby state.
  * 
  * @note  This function allows to wait and check that EEPROM has finished the 
  *        last Write operation. It is mostly used after a Write operation: after 
  *        receiving the buffer to be written, the EEPROM may need additional 
  *        time to actually perform the write operation. During this time, it 
  *        doesn't answer to I2C packets addressed to it. Once the write operation 
  *        is complete the EEPROM responds to its address.
  *        
  * @note  It is not necessary to call this function after EE_WriteBuffer() 
  *        function (EE_WriteBuffer() already calls this function after each
  *        write page operation).    
  * 
  * @param  None
  * @retval EE_OK (0) if operation is correctly performed, else return value 
  *         different from EE_OK (0) or the timeout user callback.
  */
uint32_t EE_WaitEepromStandbyState(void) 
{
  __IO uint8_t tmpSR1 = 0;
  __IO uint32_t EETrials = 0;

 /* While the bus is busy */
  EETimeout = EE_LONG_TIMEOUT;
  while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
  {
    if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  }
  
  /* Keep looping till the slave acknowledges his address or the maximum number 
     of trials is reached (this number is defined by EE_MAX_TRIALS_NUMBER define
     in stm8s_eval_i2c_ee.h file) */
  while (1)
  {
    /* Send START condition */
    I2C_GenerateSTART(ENABLE);

    /* Test on EV5 and clear it */
    EETimeout = EE_FLAG_TIMEOUT;
    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
    {
      if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
    }    

    /* Send EEPROM address for write */
    I2C_Send7bitAddress((uint8_t)EEAddress, I2C_DIRECTION_TX);
    
    /* Wait for ADDR flag to be set (Slave acknowledged his address) */
    EETimeout = EE_LONG_TIMEOUT;
    do
    {     
      /* Get the current value of the SR1 register */
      tmpSR1 = EE_I2C->SR1;
      
      /* Update the timeout value and exit if it reach 0 */
      if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
    }
    /* Keep looping till the Address is acknowledged or the AF flag is 
       set (address not acknowledged at time) */
    while((I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED)== RESET) & 
          (I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE)== RESET));
  tmpSR1 = EE_I2C->SR1;   
    /* Check if the ADDR flag has been set */
    if (tmpSR1 & I2C_SR1_ADDR)
    {
      /* Clear ADDR Flag by reading SR1 then SR3 registers (SR1 have already 
         been read) */
      (void)EE_I2C->SR3;
      
      /* STOP condition */    
      I2C_GenerateSTOP(ENABLE);
        
      /* Exit the function */
      return EE_OK;
    }
    else
    {
      /* Clear AF flag */
      I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);                  
    }
    
    /* Check if the maximum allowed number of trials has bee reached */
    if (EETrials++ == EE_MAX_TRIALS_NUMBER)
    {
      /* If the maximum number of trials has been reached, exit the function */
      return EE_TIMEOUT_UserCallback();
    }
  } 
}

#ifdef USE_DEFAULT_TIMEOUT_CALLBACK
/**
  * @brief  Basic management of the timeout situation.
  * @param  None.
  * @retval None.
  */
uint32_t EE_TIMEOUT_UserCallback(void)
{
  printf("\n\rTimeout");
  /* Block communication and all processes */
 while(1)
  {   
  }
}
#endif /* USE_DEFAULT_TIMEOUT_CALLBACK */

#ifdef USE_DEFAULT_CRITICAL_CALLBACK
/**
  * @brief  Start critical section: this callbacks should be typically used
  *         to disable interrupts when entering a critical section of I2C communication
  *         You may use default callbacks provided into this driver by uncommenting the 
  *         define USE_DEFAULT_CRITICAL_CALLBACK.
  *         Or you can comment that line and implement these callbacks into your 
  *         application.
  * @param  None.
  * @retval None.
  */
void EE_EnterCriticalSection_UserCallback(void)
{
  disableInterrupts();  
}

/**
  * @brief  End of critical section: this callbacks should be typically used
  *         to re-enable interrupts when exiting a critical section of I2C communication
  *         You may use default callbacks provided into this driver by uncommenting the 
  *         define USE_DEFAULT_CRITICAL_CALLBACK.
  *         Or you can comment that line and implement these callbacks into your 
  *         application.
  * @param  None.
  * @retval None.
  */
void EE_ExitCriticalSection_UserCallback(void)
{
  enableInterrupts();
}
#endif /* USE_DEFAULT_CRITICAL_CALLBACK */



/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/