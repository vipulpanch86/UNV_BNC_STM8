/**
  ******************************************************************************
  * @file    switch.c
  * @author  Vipul Panchal
  * @brief   Contains the functions to handle Switch Input Scanning
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bsp.h"

/* Private define ------------------------------------------------------------*/

/* Private constants----------------------------------------------------------*/
/* List of Switch Lines GPIO Port Definition */
static const GPIO_TypeDef* SW_GPIO_PORT[SW_MAX] = 
{
  SW_RST_GPIO_PORT,
  SW_CAM_GPIO_PORT,
  SW_AUTO_GPIO_PORT
};

/* List of Switch Input Lines GPIO Pin Definition */
static const uint8_t SW_GPIO_PIN[SW_MAX] = 
{
  SW_RST_GPIO_PIN,
  SW_CAM_GPIO_PIN,
  SW_AUTO_GPIO_PIN
};

/* Private variables ---------------------------------------------------------*/
static SW_INFO_T SwInfo[SW_MAX];
static uint8_t   DebounceTime = 0;
static void      (* SwitchCB)(uint8_t, uint8_t);

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Configure Switch Input Lines for I/O Function
  *         Enable the GPIO Clock, Initialize GPIO as Input for
  *         each Return Line
  * @param  None
  * @retval None
  */
@inline static void ConfigSwitchLinesIO(void)
{
  /* Configure Switch return pins as Input
     return lines are pulled up
  */
  /* Configure the Reset Key as Input & Pull-up
  */
  GPIO_Init(SW_RST_GPIO_PORT, SW_RST_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Hopper Switch as Input & Pull-up
  */
	GPIO_Init(SW_CAM_GPIO_PORT, SW_CAM_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Auto Switch as Input & Pull-up
  */
  GPIO_Init(SW_AUTO_GPIO_PORT, SW_AUTO_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

}

/**
  * @brief  Set the current state of the switch
  *         Change the current switch status depending on the previous
  *         state of the switch
  * @param  swNo - ranges form 0 to SW_MAX - 1
  * @param  pressState - the switch press state OPEN / CLOSED
  * @retval None
  */
@inline static void SetSwitchState(uint8_t swNo, uint8_t pressState)
{
  /* Waiting for a switch press */
  if(SwInfo[swNo].state == SW_STATE_IDLE)
  {
    if(pressState == CLOSED)
    {
      /* Update the state to pressed */
      SwInfo[swNo].state = SW_STATE_PRESSED;

      /* Generate a callback */
      if(SwitchCB != NULL)
      {
        SwitchCB(swNo, SwInfo[swNo].state);
      }
    }
  }
  else if(SwInfo[swNo].state == SW_STATE_PRESSED)
  {
    if(pressState == OPEN)
    {
      SwInfo[swNo].state = SW_STATE_RELEASED;

      /* Generate a callback */
      if(SwitchCB != NULL)
      {
        SwitchCB(swNo, SwInfo[swNo].state);
      }
    }
  }
  else
  {
    SwInfo[swNo].state = SW_STATE_IDLE;
  }
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Initialize the Switch Interface
  *         Initialize Switch Lines as Input,
  *         Set Switch debounce value,
  *         Install call back function.
  * @param  debounce - switch debounce value in milliseconds
  * @param  cb - callback function when a switch state changes
  * @retval None
  */
void SW_Init(uint8_t debounce, void (* cb)(uint8_t, uint8_t))
{
  uint8_t swNo;

  ConfigSwitchLinesIO();

  DebounceTime = (debounce < 1) ? (1) : (debounce);
  SwitchCB = cb;

  for(swNo = 0; swNo < SW_MAX; swNo++)
  {
    SwInfo[swNo].state = SW_STATE_IDLE;
    SwInfo[swNo].press = OPEN;
    SwInfo[swNo].debounce = FALSE;
    SwInfo[swNo].backuptime = 0;
  }
}

/**
  * @brief  Scan the Switches
  *         scans each switch sequentially and updates the switch status
  * @note   Must be called in a continious loop
  * @param  None
  * @retval None
  */
void SW_Scan(void)
{
  uint8_t swNo = 0;
  volatile uint32_t bspSysTime = BSP_GetSysTime();

  /* Scan and set switch State */  
  for(swNo = 0; swNo < SW_MAX; swNo++)
  {
    volatile uint8_t swPressState = ((SW_GPIO_PORT[swNo]->IDR & \
		                 SW_GPIO_PIN[swNo]) == 0) ?  CLOSED : OPEN;
    //printf("\n\rSW = %d, IDR = %d", (int)swNo, (int)SW_GPIO_PORT[swNo]->IDR);
    /* Check if the switch state is changed */
    if(swPressState != SwInfo[swNo].press)
    {
      /* Check if the debounce verification is done */
      if(SwInfo[swNo].debounce == TRUE)
      {
        /* wait for debounce verification */
        if(abs((int32_t)(bspSysTime - SwInfo[swNo].backuptime)) >= DebounceTime)
        {
          /* change the switch press state */
          SwInfo[swNo].press = (uint8_t)(
            SwInfo[swNo].press == OPEN ? CLOSED : OPEN);
          SwInfo[swNo].debounce = FALSE;
        }
      }
      else
      {
        /* Pre debounce check
           Mark the bsp timer for debounce check,
           set the debounce check start flag as true
         */
        SwInfo[swNo].backuptime = bspSysTime;
        SwInfo[swNo].debounce = TRUE;
      }
    }
    else
    {
      SwInfo[swNo].debounce = FALSE;
    }
    
    SetSwitchState(swNo, SwInfo[swNo].press);
  }
}

/**
  * @brief  Checks if a switch is pressed
  *         Checks the switch buffer status for SW_STATE_PRESSED & SW_STATE_HOLD
  * @param  swNo - The switch whose status needs to be checked
  * @retval TRUE if switch is pressed, FALSE if switch is released
  */
uint8_t SW_IsPressed(uint8_t swNo)
{

  if(SwInfo[swNo].state == SW_STATE_PRESSED)
  {
    return SW_PRESSED;
  }
  else
  {
    return SW_RELEASED;
  }
}

/**
  * @brief  Sets the switch debounce time
  *         Sets the switch debounce time in milliseconds
  * @param  debounce - switch debounce value in milliseconds
  * @retval None
  */
void SW_SetDebounceTime(uint8_t debounce)
{
  DebounceTime = (debounce < 1) ? (1) : (debounce);
}

/**
  * @brief  Gets the switch debounce time in milliseconds
  * @param  None
  * @retval Returns set debounce time in milliseconds
  */
uint8_t SW_GetDebounceTime(void)
{
  return DebounceTime;
}

/**
  * @brief  Installs a callback for a switch event change
  * @param  cb - pointer to the callback function
  * @retval None
  */
void SW_AddEventListener(void (* cb)(uint8_t, uint8_t))
{
  SwitchCB = cb;
}
/***********************END OF FILE************************/
