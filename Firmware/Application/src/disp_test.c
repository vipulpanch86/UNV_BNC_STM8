/**
  ******************************************************************************
  * @file    disp_test.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing Display
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
static uint32_t uppercounter = 0;
static uint16_t lowercounter = 0;
//static uint16_t turretcounter = 9999;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void DISP_Update(void)
{

  char buffer[32];
  
  sprintf(buffer, "%04d", (int)(uppercounter));
  DISP_UpperPutStr(&buffer[0], 0);

  sprintf(buffer, "%03d", (int)(lowercounter));
  DISP_LowerPutStr(&buffer[0], 0);

//  sprintf(buffer, "%04d", (int)(turretcounter));
//  DISP_TurrPutStr(&buffer[0], 0);
  
  uppercounter++;
  uppercounter %= 10000;
  
  lowercounter++;
  lowercounter %= 1000;
  
//  turretcounter++;
//  turretcounter %= 10000;
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
  
  printf("\r\nDISPLAY TEST\r\n");
  
  DISP_Init(DISP_TYPE_T8X4B8X3);

  
  
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
