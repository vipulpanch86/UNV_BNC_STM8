/**
  ******************************************************************************
  * @file    uv_test.c
  * @author  Vipul Panchal
  * @brief   This file contains the function for testing uv functionallity.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

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
void iwdg_test(void)
{
  static uint32_t BkupIwdgKickTime = 0;
  
  /* BSP Initialization -----------------------------------------*/
  BSP_Init();

  /* Check if the system has resumed from IWDG reset */
  if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
  {
    /* IWDGF flag set */
    /* Turn on LED1 */
    printf("\r\nIWDG Reset");

    /* Clear IWDGF Flag */
    RST_ClearFlag(RST_FLAG_IWDGF);
  }
  
  printf("\r\nIWDG Test");
  
  /* Watchdog Configuration */
  BSP_WatchdogConfig();
  
  BkupIwdgKickTime = BSP_GetSysTime();
  
  while(1)
  {
    uint32_t sysTime = BSP_GetSysTime();
    
    if((sysTime - BkupIwdgKickTime) >= 250)
    {
      BkupIwdgKickTime = sysTime;
      
      /* Reload IWDG counter */
      IWDG_ReloadCounter();  
      
      printf("\r\nIWDG Kicked : %u", (unsigned int)BkupIwdgKickTime);
    }
    
    if((SW_AUTO_GPIO_PORT->IDR & SW_AUTO_GPIO_PIN) == 0)
    {
      while(1)
      {
        printf("\r\nCurrentTime : %u", (unsigned int)BSP_GetSysTime());
      }
    }
  }
}

/***********************END OF FILE************************/
