/**
  ******************************************************************************
  * @file    main.c
  * @author  Vipul Panchal
  * @version  V1.0.0
  * @date     11-August-2015
  * @brief   This file contains the main function for Currency counting
  *          application.
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
void DISP_Update(void)
{
  static uint32_t counter = 0;
  char buffer[32];
  
  sprintf(buffer, "%07u", (uint32_t)counter);
  
  //DISP_UpperPutStr(&buffer[0], 0);
  DISP_UpperPutStr("HELLO W", 0);

  sprintf(buffer, "%04u", (uint32_t)(10000 - (counter%10000)));
  //DISP_LowerPutStr(&buffer[0], 0);
  DISP_LowerPutStr("ORLD", 0);
  
  
  counter++;
  counter %= 10000000;
}
/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void disp_test(void)
{
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  DISP_Init(1);

  
  while(1)
  {
    static uint32_t BkupDispExecTime = 0;
    static uint32_t BkupDispUpdateTime = 0;
    uint32_t sysTime = BSP_GetSysTime();

    if((sysTime - BkupDispUpdateTime) >= 10)
    {
      BkupDispUpdateTime = sysTime;
      DISP_Update();
    }
    
    if((sysTime - BkupDispExecTime) >= 1)
    {
      BkupDispExecTime = sysTime;
      DISP_Exec();
    }
  }
}
/***********************END OF FILE************************/
