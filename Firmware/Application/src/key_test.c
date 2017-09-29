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

/* Private define ------------------------------------------------------------*/
#define KPD_SCAN_MS (1)
  
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static const char * KEYS_STR[] = 
{
  "KEY_DIG0",
  "KEY_DIG1",
  "KEY_DIG2",
  "KEY_DIG3",
  "KEY_DIG4",
  "KEY_DIG5",
  "KEY_DIG6",
  "KEY_DIG7",
  "KEY_DIG8",
  "KEY_DIG9",
  "KEY_ADD",
  "KEY_ADD_UV",
  "KEY_VALM",
  "KEY_UV",
  "KEY_AUTO",
  "KEY_MANUAL",
  "KEY_MODE",
  "KEY_FUNC",
  "KEY_UP",
  "KEY_DOWN",
  "KEY_BACK",
  "KEY_NEXT",
  "KEY_ENT",
  "KEY_CLR"
};
  
/* Private functions ---------------------------------------------------------*/
void KeyCallBack(uint8_t keyNb, uint8_t keyState)
{
  printf("\n\r%s, St: %u", KEYS_STR[keyNb], keyState);
  //printf("\n\rKey: %u, St: %u", (uint32_t)keyNb, (uint32_t)keyState);
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void key_test(void)
{
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  KPD_Init(1, 20, KeyCallBack);
  //KPD_AddEventListener(KeyCallBack);
  
  printf("\r\nKEYPAD Test");

  while(1)
  {
    static uint32_t BkupKpdScanTime = 0;
    uint32_t sysTime = BSP_GetSysTime();
    
    if((sysTime - BkupKpdScanTime) >= KPD_SCAN_MS)
    {
      BkupKpdScanTime = sysTime;
      KPD_Scan();
    }
  }
  
}

/***********************END OF FILE************************/
