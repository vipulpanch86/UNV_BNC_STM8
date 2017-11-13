/**
  ******************************************************************************
  * @file    ui_processcount.c
  * @author  Mahajan Electronics Team
  * @version V1.0.0
  * @date    16-August-2015
  * @brief   This file contains ui count process function
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ui.h"

#define MODE_C_TRUE_COUNT            (0)
#define MODE_C_OVER_COUNT            (1)
#define MODE_C_UNDER_COUNT           (2)

static const uint8_t REG_ID_C_COUNT_TYPE[] =
{
  REG_ID_C_TRUE_COUNT,
  REG_ID_C_OVER_COUNT,
  REG_ID_C_UNDER_COUNT
};

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for Count Process
  * @param  pParam - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
uint8_t UI_ProcessCntlg(void *pParam, UI_MSG_T *pMsg)
{
  static const uint8_t *pCntLogtrings[] =
  {
    "COUNT",
    "O-CNT",
    "U-CNT"
  };
  static uint8_t cntLogType = 0;
  char string[8];
  uint32_t cntLog = 0;

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      cntLogType = MODE_C_TRUE_COUNT;
    }
    break;

    case UIMSG_KEY_BACK:
    case UIMSG_KEY_UP:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if(cntLogType == MODE_C_UNDER_COUNT)
        {
          cntLogType = MODE_C_TRUE_COUNT;
        }
        else
        {
          cntLogType++;
        }
      }
      break;

    case UIMSG_KEY_NEXT:
    case UIMSG_KEY_DOWN:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if(cntLogType == MODE_C_TRUE_COUNT)
        {
          cntLogType = MODE_C_UNDER_COUNT;
        }
        else
        {
          cntLogType--;
        }
      }
      break;

    case UIMSG_KEY_CLR:
    case UIMSG_SW_RESET:
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        return UI_RC_FINISH;
      }
      break;

    default:
      break;
  }

  REG_GetValue(&cntLog, REG_ID_C_COUNT_TYPE[cntLogType]);

  DISP_ClearAll();

  xsprintf((char *)&string[0], DISP_LOWER_STR_FORMAT, cntLog);
  DISP_LowerPutStr((char *)&string[0], 0);

  DISP_UpperPutStr((char *)pCntLogtrings[cntLogType], 0);

  return UI_RC_CONTINUE;
}
/**********************************END OF FILE*********************************/
