/**
  ******************************************************************************
  * @file    ui_processhswitch.c
  * @author  Mahajan Electronics Team
  * @version V1.0.0
  * @date    16-August-2015
  * @brief   This file contains ui hopper switch process function
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ui.h"

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for hopper switch Process
  * @param  pParam - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
uint8_t UI_ProcessHSwitch(void *pParam, UI_MSG_T *pMsg)
{
#define KEY_PRESS_BUZZ_TIME  200

  static uint8_t startHopper = FALSE;
  uint8_t hSwitchStatus = (uint8_t)BSP_ReadCamSwitch();

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      startHopper = TRUE;
      BSP_H_MotorEnable(TRUE);
    }
    break;

    case UIMSG_SW_CAM:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        BSP_EnableBuzzer(KEY_PRESS_BUZZ_TIME);

        if(startHopper == FALSE)
        {
          BSP_H_MotorEnable(FALSE);
          return UI_RC_FINISH;
        }
      }
    }
    break;

    case UIMSG_SW_RESET:
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        startHopper = FALSE;
      }
      break;
  }

  DISP_LowerClear();

  if(hSwitchStatus == TRUE)
  {
    DISP_LowerPutStr("H", (uint8_t)(DISP_LOWER_MAX_NB - 1));
  }
  else
  {
    DISP_LowerPutStr("L", (uint8_t)(DISP_LOWER_MAX_NB - 1));
  }

  return UI_RC_CONTINUE;

#undef KEY_PRESS_BUZZ_TIME
}
/**********************************END OF FILE*********************************/
