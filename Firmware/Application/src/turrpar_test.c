/**
  ******************************************************************************
  * @file    turrpar_test.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing parallel turret.
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
static void turrpar_update(void)
{
  static uint32_t counter = 0;
  char buffer[32];
  
  sprintf(buffer, "%04u", counter);
  
  DISP_TurrPutStr(&buffer[0], 0);
  
  counter++;
  counter %= 10000;
}
/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void turrpar_test(void)
{
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  DISP_Init(0);
  
  while(1)
  {
    static uint32_t BkupDispExecTime = 0;
    static uint32_t BkupDispUpdateTime = 0;
    uint32_t sysTime = BSP_GetSysTime();

    if((sysTime - BkupDispUpdateTime) >= 10)
    {
      BkupDispUpdateTime = sysTime;
      turrpar_update();
    }
    
    if((sysTime - BkupDispExecTime) >= DISP_EXEC_MS)
    {
      BkupDispExecTime = sysTime;
      DISP_Exec();
    }
  }
}
/***********************END OF FILE************************/
