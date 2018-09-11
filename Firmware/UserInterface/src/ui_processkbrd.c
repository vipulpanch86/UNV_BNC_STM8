/**
  ******************************************************************************
  * @file    ui_processkbrd.c
  * @author  Vipul Panchal
  * @brief   This file contains ui keyboard process function
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ui.h"

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for Keyboard Process
  * @param  pParam - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
uint8_t UI_ProcessKeyboard(void *pParam, UI_MSG_T *pMsg)
{
  static uint8_t testReset = TRUE;
  static uint8_t testClear = TRUE;

  if(pMsg->message == UIMSG_INIT)
  {
    testReset = TRUE;
    testClear = TRUE;
    DISP_LowerClear();
  }
  else

  if(pMsg->message == UIMSG_KEY_DIG0)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_0), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG1)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_1), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG2)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_2), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG3)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_3), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG4)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_4), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG5)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_5), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG6)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_6), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG7)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_7), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG8)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_8), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DIG9)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_KEY_9), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_ADD)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_ADD), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_ADD_UV)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_ADD_UV), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_VALM)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_VALUE), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_UV)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_UV), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_AUTO)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_AUTO), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_MANUAL)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_MANUAL), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_MODE)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_MODE), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_FUNC)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_FUNCTION), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_TENS)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_TENS), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_UNITS)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_UNITS), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_UP)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_UP), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_DOWN)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_DOWN), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_BACK)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_BACK), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_NEXT)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_NEXT), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_ENT)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_ENTER), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_KEY_CLR)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      if(testClear == TRUE)
      {
        testClear = FALSE;

        DISP_UpperClear();
        DISP_UpperPutStr(UI_GetString(UI_STR_CLEAR), 0);
      }
      else
      {
        testClear = TRUE;

        return UI_RC_FINISH;
      }
    }
  }
  else
  if(pMsg->message == UIMSG_SW_AUTO)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_SW_AUTO), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_SW_CAM)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testReset = TRUE;
      testClear = TRUE;
      DISP_UpperClear();
      DISP_UpperPutStr(UI_GetString(UI_STR_SW_CAM), 0);
    }
  }
  else
  if(pMsg->message == UIMSG_SW_RESET)
  {
    if((uint8_t)pMsg->param == UI_PRESS)
    {
      testClear = TRUE;
      if(testReset == TRUE)
      {
        testReset = FALSE;

        DISP_UpperClear();
        DISP_UpperPutStr(UI_GetString(UI_STR_RESET), 0);
      }
      else
      {
        testReset = TRUE;

        return UI_RC_FINISH;
      }
    }
  }
    
  return UI_RC_CONTINUE;
}
/**********************************END OF FILE*********************************/
