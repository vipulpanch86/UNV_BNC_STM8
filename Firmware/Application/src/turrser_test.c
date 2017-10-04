/**
  ******************************************************************************
  * @file    turrser_test.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing serial turret.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"
#include "ui.h"

/* Private typedef -----------------------------------------------------------*/
#define DISP_EXEC_MS (1)

/* Private define ------------------------------------------------------------*/
  
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
static void turrser_update(void)
{
  static uint16_t counter = 0;
	
  TURR_PutVal(counter);
  
  counter++;
  counter %= 10000;
}
/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void turrser_test(void)
{
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  //DISP_Init(0);
  
  while(1)
  {
    static uint32_t BkupDispExecTime = 0;
    static uint32_t BkupDispUpdateTime = 0;
    uint32_t sysTime = BSP_GetSysTime();

    if((sysTime - BkupDispUpdateTime) >= 10)
    {
      BkupDispUpdateTime = sysTime;
      turrser_update();
    }
    
    if((sysTime - BkupDispExecTime) >= 10)
    {
      BkupDispExecTime = sysTime;
      TURR_Exec();
    }
  }
}
/***********************END OF FILE************************/
