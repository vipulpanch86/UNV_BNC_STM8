/**
  ******************************************************************************
  * @file    rotdip_test.c 
  * @author  MCD Application Team
  * @version V1.3.0
  * @date    16-January-2014
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
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
#include <stdio.h>
#include "bsp.h"

/** @addtogroup STM32F0xx_StdPeriph_Examples
  * @{
  */

/** @addtogroup USART_Printf
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
void rotdip_test(void)
{
  uint8_t dipPos = 0;
  /*!< At this stage the microcontroller clock setting is already configured, 
       this is done through SystemInit() function which is called from startup
       file (startup_stm32f0xx.s) before to branch to application main.
       To reconfigure the default setting of SystemInit() function, refer to
       system_stm32f0xx.c file
     */     
  BSP_Init();
  
  /* Output a message on Hyperterminal using printf function */
  printf("\n\rROTARY DIP SWITCH TEST: \n\r");

  while (1)
  {
    uint8_t dippos_loc = BSP_ReadRotDipSwitch();
    if(dippos_loc != dipPos)
    {
      dipPos = dippos_loc;
      printf("\n\rSW POS: %u", (unsigned int)dipPos );
    }
  }
}

/**
  * @}
  */ 

/**
  * @}
  */ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
