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
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  //BSP_UV_DetectEnable(TRUE);
  printf("\r\nUV Test");

  while(1)
  {
    //BSP_AdcExec();
    
    static uint32_t BkupAdcPrintTime = 0;
    uint32_t sysTime = BSP_GetSysTime();
    
    if((sysTime - BkupAdcPrintTime) >= 500)
    {
      BkupAdcPrintTime = sysTime;
      printf("\r\nADC Val = %u", (unsigned int)BSP_GetADC());
    }
  }
}

/***********************END OF FILE************************/
