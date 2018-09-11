/**
  ******************************************************************************
  * @file    ui_processuvenb.c
  * @author  Vipul Panchal
  * @brief   This file contains ui UV Enable process function
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ui.h"

/* Private typedef -----------------------------------------------------------*/
typedef enum
{
  PROC_UVENB_EDIT,
  PROC_UVENB_WRITE,

  PROC_UVENB_MAX

} UVENB_PROCESS_LIST;

/* Private function prototypes -----------------------------------------------*/
static uint8_t ProcUvenbEdit(void *param, UI_MSG_T *pMsg);
static uint8_t ProcUvenbWrite(void *param, UI_MSG_T *pMsg);

/* Private constants----------------------------------------------------------*/
static const UI_PROC_PF PF_PROC_UVENB_LIST[] =
{
  ProcUvenbEdit,
  ProcUvenbWrite
};

/* Private variables ---------------------------------------------------------*/
static UI_PROC_PF pfProcUvenb = NULL;

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for UV Enable Process
  * @param  pParam - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcUvenbEdit(void *pParam, UI_MSG_T *pMsg)
{
  const char *lower_str;
  const char *upper_str;

  static uint32_t uvEnable = FALSE;

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      REG_GetValue(&uvEnable, REG_ID_UV_EN_FLAG);

      lower_str = (uvEnable == 0) ? UI_GetString(UI_STR_DIS) :
                  UI_GetString(UI_STR_EN);
          
      DISP_ClearAll();
      DISP_LowerPutStr((char *)lower_str, 0);
    }
    break;

    case UIMSG_KEY_UP:
    case UIMSG_KEY_DOWN:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        uvEnable = uvEnable == FALSE ? TRUE : FALSE;
      }
      break;

    case UIMSG_KEY_BACK:
    case UIMSG_KEY_NEXT:
      if((uint8_t)pMsg->param == UI_RELEASE)
      {
        uvEnable = uvEnable == FALSE ? TRUE : FALSE;
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
        pfProcUvenb = PF_PROC_UVENB_LIST[PROC_UVENB_WRITE];

        if(uvEnable == FALSE)
        {
          uint8_t flagUVDetect = FALSE;
          UV_SetDetectFlag(flagUVDetect);
        }

        REG_SetValue(&uvEnable, REG_ID_UV_EN_FLAG);

        return (pfProcUvenb(pParam, &msg));
      }
      break;
  }

  upper_str = (uvEnable == 0) ? UI_GetString(UI_STR_DISABLE) :
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
static uint8_t ProcUvenbWrite(void *param, UI_MSG_T *pMsg)
{
  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      UI_MSG_T msg = {0, UIMSG_INIT};

      pfProcUvenb = PF_PROC_UVENB_LIST[PROC_UVENB_EDIT];

      return (pfProcUvenb(param, &msg));
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
uint8_t UI_ProcessUvenb(void *param, UI_MSG_T *pMsg)
{
  if(pMsg->message == UIMSG_INIT)
  {
    pfProcUvenb = PF_PROC_UVENB_LIST[PROC_UVENB_EDIT];
  }

  return (pfProcUvenb(param, pMsg));
}
/**********************************END OF FILE*********************************/
