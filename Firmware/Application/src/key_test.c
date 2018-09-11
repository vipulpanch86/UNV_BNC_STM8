/**
  ******************************************************************************
  * @file    main.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing keypad functionality
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

static const char * KEYS_STATE[] = 
{
  "IDLE",
  "PRESSED",
  "RELEASED"
};

/* Private functions ---------------------------------------------------------*/
void KeyCallBack(uint8_t keyNb, uint8_t keyState)
{
  printf("\n\r%s, St: %s", KEYS_STR[keyNb], KEYS_STATE[keyState]);
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
  KPD_Init(KPD_TYPE_15_4X4, 20, KeyCallBack);
  
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
