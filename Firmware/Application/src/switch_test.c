/**
  ******************************************************************************
  * @file    main.c
  * @author  Mahajan Electronics Team
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
#define SW_SCAN_MS (1)

/* Private define ------------------------------------------------------------*/
  
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void USART_Config(void);

/* Private functions ---------------------------------------------------------*/
void SwCallBack(uint8_t swNb, uint8_t swState)
{
  printf("\n\rSw no: %u, SwState: %u", swNb, swState);
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void switch_test(void)
{
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  SW_Init(20, SwCallBack);
  
  printf("\r\nSwitch Test");

  while(1)
  {
    static uint32_t BkupSwScanTime = 0;
    uint32_t sysTime = BSP_GetSysTime();
    
    if((sysTime - BkupSwScanTime) >= SW_SCAN_MS)
    {
      BkupSwScanTime = sysTime;
      SW_Scan();
    }
  }
  
}

/***********************END OF FILE************************/
