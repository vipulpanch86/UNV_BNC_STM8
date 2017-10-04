/**
  ******************************************************************************
  * @file    sensor_test.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing sensor counting.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"
#include "ui.h"

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
void sensor_test(void)
{
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  
  printf("\r\nSENSOR Test");

  while(1)
  {
    extern __IO uint32_t BspSensorCounter;
    
    static uint32_t BkupSensorCounter = 0;
    
    if(BkupSensorCounter != BspSensorCounter)
    {
      BkupSensorCounter = BspSensorCounter;
      printf("\r\nSensor Counter = %u", (unsigned int)BspSensorCounter);
    }
  }
}

/***********************END OF FILE************************/
