/**
  ******************************************************************************
  * @file    ui_callback.c
  * @author  CG Global R&D MCoEx - D&A Team
  * @version V1.0.0
  * @date    13-November-2014
  * @brief   User Interface Callback Source File.
  *           + Implements the callback to map events from bsp to UI messages
  *
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 Crompton Greaves</center></h2>
  *
  * This material is considered a trade secret by Crompton Greaves Limited.
  * Unauthorized access prohibited
  * This software is provided "as is" without warranty or merchantability or
  * fitness for a particular purpose.
  * Further, Crompton Greaves doesn't warrant/guarantee, or make any
  * representations regarding the use, or the result of the use, of the
  * software interms of correctness, accuracy, readability or otherwise.
  *
  ******************************************************************************
  */

/** @addtogroup User_Interface
  * @{
  */

/** @addtogroup UI_Callback
  * @{
  */

/** @addtogroup UI_Callback_Private_Includes
  * @{
  */
#include "bsp.h"

#include "ui.h"

#define KEY_PRESS_BUZZ_TIME    100
#define SW_PRESS_BUZZ_TIME     100
/**
  * @}
  */

/* Private typedef -----------------------------------------------------------*/
typedef struct
{
  uint8_t  nb;
  uint8_t  msg;
  uint8_t  buzz;
} MSG_MAP_T;

/** @addtogroup UI_Callback_Private_Constants_Tables
  * @{
  */
/* UI Key code Mapping to BSP Key code */
static const MSG_MAP_T MSG_KEY_CODE[] =
{
  /* KPD_KEY_DIG0 */
  KPD_KEY_DIG0,   UIMSG_KEY_DIG0,   TRUE,

  /* KPD_KEY_DIG1 */
  KPD_KEY_DIG1,   UIMSG_KEY_DIG1,   TRUE,

  /* KPD_KEY_DIG2 */
  KPD_KEY_DIG2,   UIMSG_KEY_DIG2,   TRUE,

  /* KPD_KEY_DIG3 */
  KPD_KEY_DIG3,   UIMSG_KEY_DIG3,   TRUE,

  /* KPD_KEY_DIG4 */
  KPD_KEY_DIG4,   UIMSG_KEY_DIG4,   TRUE,

  /* KPD_KEY_DIG5 */
  KPD_KEY_DIG5,   UIMSG_KEY_DIG5,   TRUE,

  /* KPD_KEY_DIG6 */
  KPD_KEY_DIG6,   UIMSG_KEY_DIG6,   TRUE,

  /* KPD_KEY_DIG7 */
  KPD_KEY_DIG7,   UIMSG_KEY_DIG7,   TRUE,

  /* KPD_KEY_DIG8 */
  KPD_KEY_DIG8,   UIMSG_KEY_DIG8,   TRUE,

  /* KPD_KEY_DIG9 */
  KPD_KEY_DIG9,   UIMSG_KEY_DIG9,   TRUE,

  /* KPD_KEY_ADD */
  KPD_KEY_ADD,    UIMSG_KEY_ADD,    TRUE,

  /* KPD_KEY_ADD_UV */
  KPD_KEY_ADD_UV, UIMSG_KEY_ADD_UV, TRUE,

  /* KPD_KEY_VALM */
  KPD_KEY_VALM,   UIMSG_KEY_VALM,   TRUE,

  /* KPD_KEY_UV */
  KPD_KEY_UV,     UIMSG_KEY_UV,     TRUE,

  /* KPD_KEY_AUTO */
  KPD_KEY_AUTO,   UIMSG_KEY_AUTO,   TRUE,

  /* KPD_KEY_MANUAL */
  KPD_KEY_MANUAL, UIMSG_KEY_MANUAL, TRUE,

  /* KPD_KEY_MODE */
  KPD_KEY_MODE,   UIMSG_KEY_MODE,   TRUE,

  /* KPD_KEY_FUNC */
  KPD_KEY_FUNC,   UIMSG_KEY_FUNC,   TRUE,

  /* KPD_KEY_UP */
  KPD_KEY_UP,     UIMSG_KEY_UP,     TRUE,

  /* KPD_KEY_DOWN */
  KPD_KEY_DOWN,   UIMSG_KEY_DOWN,   TRUE,

  /* KPD_KEY_BACK */
  KPD_KEY_BACK,   UIMSG_KEY_BACK,   TRUE,

  /* KPD_KEY_NEXT */
  KPD_KEY_NEXT,   UIMSG_KEY_NEXT,   TRUE,

  /* KPD_KEY_ENT */
  KPD_KEY_ENT,    UIMSG_KEY_ENT,    TRUE,

  /* KPD_KEY_CLR */
  KPD_KEY_CLR,    UIMSG_KEY_CLR,    TRUE,
  
  /* KPD_KEY_V10 */
  KPD_KEY_V10,    UIMSG_KEY_V10,    TRUE,
  
  /* KPD_KEY_V20 */
  KPD_KEY_V20,    UIMSG_KEY_V20,    TRUE,
  
  /* KPD_KEY_V50 */
  KPD_KEY_V50,    UIMSG_KEY_V50,    TRUE,
  
  /* KPD_KEY_V100 */
  KPD_KEY_V100,   UIMSG_KEY_V100,   TRUE,
  
  /* KPD_KEY_V500 */
  KPD_KEY_V500,   UIMSG_KEY_V500,   TRUE,
  
  /* KPD_KEY_V1000 */
  KPD_KEY_V1000,  UIMSG_KEY_V1000,  TRUE,
  
  /* KPD_KEY_TENS */
  KPD_KEY_TENS,   UIMSG_KEY_TENS,   TRUE,
  
  /* KPD_KEY_UNITS */
  KPD_KEY_UNITS,  UIMSG_KEY_UNITS,  TRUE,
  
};

/* UI Key code Mapping to BSP Key code */
static const MSG_MAP_T MSG_SW_CODE[] =
{
  /* SW_RESET */
  SW_RESET, UIMSG_SW_RESET, TRUE,
  
  /* SW_CAM */
  SW_CAM,   UIMSG_SW_CAM,   FALSE,
  
  /* SW_AUTO */
  SW_AUTO,  UIMSG_SW_AUTO,  TRUE,
};
/**
  * @}
  */

/** @addtogroup UI_Callback_Public_Functions
  * @{
  */

/**
  * @brief  Callback function for keypad
  *         Generates a UI Message when a state change in
  *         any key is detected
  * @param  keyNb - Key Number for which it is called back
  * @param  keyState - Key State change which was detected
  * @retval None
  */
void UI_KeyCallBack(uint8_t keyNb, uint8_t keyState)
{
  UI_MSG_T msg = {0, 0};
  uint8_t index;
  uint8_t totalNbKeys = sizeof(MSG_KEY_CODE) / sizeof(MSG_MAP_T);

  for(index = 0; index < totalNbKeys;)
  {
    if(MSG_KEY_CODE[index].nb == keyNb)
    {
      break;
    }
    else
    {
      index++;
    }
  }

  switch(keyState)
  {
    /*  Commented the State as it is not required in this case.
        case KEY_STATE_IDLE:
        break;
    */
    case KEY_STATE_PRESSED:
      if(MSG_KEY_CODE[index].msg != UIMSG_INVALID)
      {
        msg.message = MSG_KEY_CODE[index].msg;
        msg.param   = (uint8_t)UI_KEY_PRESS;

        if(MSG_KEY_CODE[index].buzz == TRUE)
        {
          BSP_EnableBuzzer(KEY_PRESS_BUZZ_TIME);
        }
      }
      break;

    case KEY_STATE_RELEASED:
      if(MSG_KEY_CODE[index].msg != UIMSG_INVALID)
      {
        msg.message = MSG_KEY_CODE[index].msg;
        msg.param   = (uint8_t)UI_KEY_RELEASE;
      }
      break;

    default:
      return;
  }

  UI_PostMessage(&msg);
}

/**
  * @brief  Callback function for Switch
  *         Generates a UI Message when a state change in
  *         any switch is detected
  * @param  swNb - Switch Number for which it is called back
  * @param  swState - Switch State change which was detected
  * @retval None
  */
void UI_SwCallBack(uint8_t swNb, uint8_t swState)
{
  UI_MSG_T msg = {0, 0};
  uint8_t index;
  uint8_t totalNbSw = sizeof(MSG_SW_CODE) / sizeof(MSG_MAP_T);

  for(index = 0; index < totalNbSw;)
  {
    if(MSG_SW_CODE[index].nb == swNb)
    {
      break;
    }
    else
    {
      index++;
    }
  }

  switch(swState)
  {
    /*  Commented the State as it is not required in this case.
        case SW_STATE_IDLE:
        break;
    */
    case SW_STATE_PRESSED:
      if(MSG_SW_CODE[index].msg != UIMSG_INVALID)
      {
        msg.message = MSG_SW_CODE[index].msg;
        msg.param   = (uint8_t)UI_SW_PRESS;

        if(MSG_SW_CODE[index].buzz == TRUE)
        {
          BSP_EnableBuzzer(SW_PRESS_BUZZ_TIME);
        }
      }
      break;

    case SW_STATE_RELEASED:
      if(MSG_SW_CODE[index].msg != UIMSG_INVALID)
      {
        msg.message = MSG_SW_CODE[index].msg;
        msg.param   = (uint8_t)UI_SW_RELEASE;
      }
      break;

    default:
      return;
  }

  UI_PostMessage(&msg);
}

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT Crompton Greaves ******END OF FILE*****/
