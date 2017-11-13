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
static uint32_t uppercounter = 99999;
static uint16_t lowercounter = 9999;
static uint16_t turretcounter = 9999;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void DISP_Update(void)
{

  char buffer[32];
  
  sprintf(buffer, "%05d", (int)(uppercounter));
  //printf("\n\r%s", &buffer[0]);
  DISP_UpperPutStr(&buffer[0], 0);
  //DISP_UpperPutStr("HELLO", 0);

  sprintf(buffer, "%03d", (int)(1000 - lowercounter));
  //printf("\n\r%s", &buffer[0]);
  DISP_LowerPutStr(&buffer[0], 0);
  //DISP_LowerPutStr("1234", 0);
  sprintf(buffer, "%04d", (int)(turretcounter));
  //printf("\n\r%s", &buffer[0]);
  DISP_TurrPutStr(&buffer[0], 0);
  //DISP_TurrPutStr("ABCD", 0);
  
  uppercounter++;
  uppercounter %= 100000;
  
  lowercounter++;
  lowercounter %= 1000;
  
  turretcounter++;
  turretcounter %= 10000;
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
  DISP_Init(DISP_TYPE_T8X5B8X3_T1);

  
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
