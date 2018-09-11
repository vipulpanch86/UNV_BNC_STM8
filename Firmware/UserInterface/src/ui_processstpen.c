/**
  ******************************************************************************
  * @file    ui_processstpen.c
  * @author  Vipul Panchal
  * @brief   This file contains ui Stamp Enable process function
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ui.h"

/* Private typedef -----------------------------------------------------------*/
typedef enum
{
  PROC_STPEN_EDIT,
  PROC_STPEN_WRITE,

  PROC_STPEN_MAX

} STPEN_PROCESS_LIST;

/* Private function prototypes -----------------------------------------------*/
static uint8_t ProcStpenEdit(void *param, UI_MSG_T *pMsg);
static uint8_t ProcStpenWrite(void *param, UI_MSG_T *pMsg);

/* Private constants----------------------------------------------------------*/
static const UI_PROC_PF PF_PROC_STPEN_LIST[] =
{
  ProcStpenEdit,
  ProcStpenWrite
};

/* Private variables ---------------------------------------------------------*/
static UI_PROC_PF pfProcStpen = NULL;

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for STAMP Enable Process
  * @param  pParam - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcStpenEdit(void *pParam, UI_MSG_T *pMsg)
{
  const char *lower_str;
  const char *upper_str;

  static uint32_t stampEnable = FALSE;

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);

    lower_str = (stampEnable == 0) ? UI_GetString(UI_STR_DIS) :
          UI_GetString(UI_STR_EN);
          
      DISP_ClearAll();
      DISP_LowerPutStr((char *)lower_str, 0);
    }
    break;

    case UIMSG_KEY_UP:
    case UIMSG_KEY_DOWN:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        stampEnable = stampEnable == FALSE ? TRUE : FALSE;
      }
      break;

    case UIMSG_KEY_BACK:
    case UIMSG_KEY_NEXT:
      if((uint8_t)pMsg->param == UI_RELEASE)
      {
        stampEnable = stampEnable == FALSE ? TRUE : FALSE;
      }
      break;
    
    case UIMSG_KEY_CLR:
    case UIMSG_SW_RESET:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        return UI_RC_FINISH;
      }
      break;

    case UIMSG_KEY_ENT:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        pfProcStpen = PF_PROC_STPEN_LIST[PROC_STPEN_WRITE];

        if(stampEnable == FALSE)
        {
          uint8_t cntMode = COUNTER_GetMode();

          if(cntMode == COUNT_MODE_S)
          {
            cntMode = COUNT_MODE_C;
            COUNTER_SetMode(cntMode);
          }
        }

        REG_SetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);

        return (pfProcStpen(pParam, &msg));
      }
      break;
  }

  upper_str = (stampEnable == 0) ? UI_GetString(UI_STR_DISABLE) :
        UI_GetString(UI_STR_ENABLE);

  DISP_UpperClear();
  DISP_UpperPutStr((char *)upper_str, 0);

  return UI_RC_CONTINUE;
}


/**
  * @brief  Internal Process Function for Home Write Memory
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcStpenWrite(void *param, UI_MSG_T *pMsg)
{
  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      UI_MSG_T msg = {0, UIMSG_INIT};

      pfProcStpen = PF_PROC_STPEN_LIST[PROC_STPEN_EDIT];

      return (pfProcStpen(param, &msg));
    }

    default:
      break;
  }

  return UI_RC_CONTINUE;
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for Stop Enable
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
uint8_t UI_ProcessStpen(void *param, UI_MSG_T *pMsg)
{
  if(pMsg->message == UIMSG_INIT)
  {
    pfProcStpen = PF_PROC_STPEN_LIST[PROC_STPEN_EDIT];
  }

  return (pfProcStpen(param, pMsg));
}
/**********************************END OF FILE*********************************/
