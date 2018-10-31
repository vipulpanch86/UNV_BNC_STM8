/**
  ******************************************************************************
  * @file    uv_test.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing uv functionallity.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
//__IO uint16_t UnFilAdcValue = 0;
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void uv_test(void)
{
	uint8_t UV_On = 0;
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  
  printf("\r\nUV Test");
/*
  while(1)
  {
    static uint32_t BkupAdcPrintTime = 0;
    uint32_t sysTime = BSP_GetSysTime();
		
    if (UV_On == 1)
		{
			BSP_UV_DetectEnable(TRUE);
		}
		else
		{
			BSP_UV_DetectEnable(FALSE);
		}
    
    if((sysTime - BkupAdcPrintTime) >= 500)
    {
      BkupAdcPrintTime = sysTime;
      printf("\r\nADC Val = %u, %u", (unsigned int)BSP_GetADC(), (unsigned int)UV_On);
			UV_On ^= 1;
    }
  }
	*/
	BSP_UV_DetectEnable(TRUE);
	while(1)
  {
    uint16_t adcVal = BSP_GetADC();
    if(adcVal >= 700)
    {
      printf("\r\nADC Val = %u", (unsigned int)adcVal);
    }
  }
}

/***********************END OF FILE************************/
