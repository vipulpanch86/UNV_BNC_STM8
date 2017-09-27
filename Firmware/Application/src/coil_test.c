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
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void coil_test(void)
{
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  SW_Init(20, NULL);
  
  printf("\r\nCoil Test");

  while(1)
  {
    static uint32_t BkupSwScanTime = 0;
    uint32_t sysTime = BSP_GetSysTime();
    
    if((sysTime - BkupSwScanTime) >= SW_SCAN_MS)
    {
      BkupSwScanTime = sysTime;
      SW_Scan();
    }
    
    if(SW_IsPressed(SW_CAM) == TRUE)
    {
      BSP_B_CoilEnable(TRUE);
    }
    else
    {
      BSP_B_CoilEnable(FALSE);
    }

    if(SW_IsPressed(SW_AUTO) == TRUE)
    {
      BSP_S_CoilEnable(TRUE);
    }
    else
    {
      BSP_S_CoilEnable(FALSE);
    }
  }
}
/***********************END OF FILE************************/
