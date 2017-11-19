/**
  ******************************************************************************
  * @file    rotdip_test.c 
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing Rotary Dip Switch.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

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

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
