/**
  ******************************************************************************
  * @file    ui_processhome.c
  * @author  Mahajan Electronics Team
  * @version V1.0.0
  * @date    16-August-2015
  * @brief   This file contains ui home process function
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <string.h>

#include "bsp.h"
#include "ui.h"

/* Private typedef -----------------------------------------------------------*/
typedef enum
{
  PROC_HOME_TEST_KPD,
  PROC_HOME_WELCOME_MSG,
  PROC_HOME_TEST_START,
  PROC_HOME_TEST_END,
  PROC_HOME_IDLE,
  PROC_HOME_EDIT,
  PROC_HOME_START_H_MOTOR,
  PROC_HOME_START_S_MOTOR,
  PROC_HOME_START_B_COIL,
  PROC_HOME_STOP_H_MOTOR,
  PROC_HOME_START_S_COIL,
  PROC_HOME_WRITE_MEMORY,
  PROC_HOME_BEEP,
  PROC_HOME_ERROR_01,
  PROC_HOME_ERROR_02,

  PROC_HOME_MAX

} HOME_PROCESS_LIST;

/* Private function prototypes -----------------------------------------------*/
static uint8_t ProcHomeTestKeypad(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeWelcomeMsg(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeTestStart(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeTestEnd(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeIdle(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeEdit(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeStartHMotor(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeStartSMotor(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeStartBCoil(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeStopHMotor(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeStartSCoil(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeWriteMemory(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeBeep(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeError01(void *param, UI_MSG_T *pMsg);
static uint8_t ProcHomeError02(void *param, UI_MSG_T *pMsg);

/* Private constants----------------------------------------------------------*/
static const UI_PROC_PF PF_PROC_HOME_LIST[] =
{
  ProcHomeTestKeypad,
  ProcHomeWelcomeMsg,
  ProcHomeTestStart,
  ProcHomeTestEnd,
  ProcHomeIdle,
  ProcHomeEdit,
  ProcHomeStartHMotor,
  ProcHomeStartSMotor,
  ProcHomeStartBCoil,
  ProcHomeStopHMotor,
  ProcHomeStartSCoil,
  ProcHomeWriteMemory,
  ProcHomeBeep,
  ProcHomeError01,
  ProcHomeError02
};

static const uint8_t REG_ID_ACC_CTR_LIST[] =
{
  REG_ID_ACC_SENSOR_C_CTR,
  REG_ID_ACC_SENSOR_B_CTR,
  REG_ID_ACC_SENSOR_F_CTR,
  REG_ID_ACC_SENSOR_S_CTR,
  REG_ID_ACC_SENSOR_V_CTR
};

static const uint8_t REG_ID_SET_CNT_LIST[] =
{
  REG_ID_NOTE_C_COUNT,
  REG_ID_NOTE_B_COUNT,
  REG_ID_INVALID,
  REG_ID_NOTE_S_COUNT,
  REG_ID_NOTE_V_COUNT
};

/* Private variables ---------------------------------------------------------*/
static UI_PROC_PF pfProcHome = NULL;

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Internal Function for switching Home Sub Proecess
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t SwitchHomeSubProcess(void *param, UI_MSG_T *pMsg)
{
  UI_ClearAllMessage();
	
  return (pfProcHome(param, pMsg));	
}

/**
  * @brief  Internal Function for managing displaying while counting
  * @param  None
  * @retval None
  */
static void HomeDispCounter(void)
{
  const char charCountMode[COUNT_MODE_MAX] =
  {
    'C',
    'B',
    'F',
    'S',
    'V'
  };
  const uint8_t COUNT_MODE_LED_LIST[COUNT_MODE_MAX] =
  {
    DISP_LED_VERIFY,
    DISP_LED_BATCH,
    DISP_LED_FREE,
    DISP_LED_STAMP,
    DISP_LED_VALUE
  };

  static uint8_t  lacsDispEn = TRUE;
  static uint32_t BkupSysTimer = 0;

  uint32_t TopDispValue, BotDispValue;
  uint8_t strTopDisp[8], strBotDisp[8];
  uint32_t noteSetCount = 0, valueCounter = 0, accSensorCount = 0;

  uint8_t flagAutoCount = AUTO_GetFlag();
  uint8_t flagAddCount = ADD_GetFlag();
  uint8_t flagValueEnable = VALUE_GetFlag();
  uint8_t flagSensorEnable = SENSOR_GetEnable();
  uint8_t flagUVDetect = UV_GetDetectFlag();
  uint8_t cntMode = COUNTER_GetMode();
  uint32_t sensorCounter = SENSOR_GetCount();

  REG_GetValue(&valueCounter, REG_ID_VALUE_COUNTER);
  REG_GetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
  REG_GetValue(&noteSetCount, REG_ID_SET_CNT_LIST[cntMode]);

  /* Clear all Display */
  DISP_ClearAll();
  
  DISP_Led(DISP_LED_ADD, (uint8_t)flagAddCount);
  DISP_Led(DISP_LED_AUTO, (uint8_t)flagAutoCount);
  DISP_Led(DISP_LED_MANUAL, (uint8_t)~flagAutoCount);
  DISP_Led(DISP_LED_UV, (uint8_t)flagUVDetect);
  DISP_Led(COUNT_MODE_LED_LIST[cntMode], TRUE);

  if(cntMode == COUNT_MODE_V)
  {
    if(noteSetCount == 10)
    {
      DISP_Led(DISP_LED_V_10, TRUE);
    }
    else if(noteSetCount == 20)
    {
      DISP_Led(DISP_LED_V_20, TRUE);
    }
    else if(noteSetCount == 50)
    {
      DISP_Led(DISP_LED_V_50, TRUE);
    }
    else if(noteSetCount == 100)
    {
      DISP_Led(DISP_LED_V_100, TRUE);
    }
    else if(noteSetCount == 500)
    {
      DISP_Led(DISP_LED_V_500, TRUE);
    }
    else if(noteSetCount == 1000)
    {
      DISP_Led(DISP_LED_V_1000, TRUE);
    }
  }

  /* Display Handling;
     If Add Flag is TRUE, show Added Count on 16 Seg &  Running Count on 7seg,  No display for Set Count
     If Add Flag is FALSE, show Running Count on 16seg and set count on 7seg
  */
  memset(&strTopDisp[0], ' ', sizeof(strTopDisp));
  memset(&strBotDisp[0], ' ', sizeof(strBotDisp));

  if(flagAddCount == TRUE)
  {
    TopDispValue = accSensorCount;
    BotDispValue = (sensorCounter > 0) ? sensorCounter : noteSetCount;
  }
  else
  {
    if(flagValueEnable)
    {
      TopDispValue = (cntMode == COUNT_MODE_V) ? valueCounter : sensorCounter;
      BotDispValue = (cntMode == COUNT_MODE_V) ?
               ((sensorCounter > 0) ? sensorCounter : noteSetCount) : noteSetCount;
    }
    else
    {
      TopDispValue = sensorCounter;
      BotDispValue = noteSetCount;
    }
  }

  /* Top Display */
  if(TopDispValue > (MAX_LCD_RESLN / 10))
  {
    /* Toggle Lacs & Thousand */
    if(flagSensorEnable)
    {
      if(TopDispValue > MAX_LCD_RESLN)
      {
        sprintf((char *)&strTopDisp[0], "%lu%c", TopDispValue / (MAX_LCD_RESLN + 1), LCD_WRAP_CHAR);
      }
      else
      {
        sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT, TopDispValue);
      }
    }
    else
    {
      if(TopDispValue > MAX_LCD_RESLN)
      {
        uint32_t SysTimer = BSP_GetSysTime();

        if(abs((int32_t)(SysTimer - BkupSysTimer)) >= 1000)
        {
          BkupSysTimer = SysTimer;
          lacsDispEn = (uint8_t)((lacsDispEn == TRUE) ? FALSE : TRUE);
        }

        if(lacsDispEn == TRUE)
        {
          sprintf((char *)&strTopDisp[0], "%lu%c", TopDispValue / (MAX_LCD_RESLN + 1), LCD_WRAP_CHAR);
        }
        else
        {
          sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT,
                  TopDispValue % (MAX_LCD_RESLN + 1));
        }
      }
      else
      {
        sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT, TopDispValue);
      }
    }
  }
  else
  {
    sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT, TopDispValue);
    strTopDisp[0] = (char)charCountMode[cntMode];
  }

  /* Bottom Display */
  if(BotDispValue > 0)
  {
    sprintf((char *)&strBotDisp[0], DISP_LOWER_STR_FORMAT, BotDispValue);
  }

  DISP_UpperPutStr((char *)&strTopDisp[0], 0);
  DISP_LowerPutStr((char *)&strBotDisp[0], 0);

  DISP_TurrPutStr((char *)&strTopDisp[DISP_UPPER_MAX_NB - DISP_TURRET_MAX_NB], 0);
  TURR_PutVal((uint16_t)(TopDispValue % 10000)); /* Pending - Magic Number */
}

/**
  * @brief  Internal Process Function for Starting the Power On Keypad Test
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeTestKeypad(void *param, UI_MSG_T *pMsg)
{
#define KEY_CHECK_REFRESH    500
#define BEEP_ON_TIME         200

  //static uint8_t BeepOn = FALSE;

  switch(pMsg->message)
  {
    case UIMSG_INIT:
      //BeepOn = FALSE;
      UI_SetRefreshMsg(KEY_CHECK_REFRESH * 2);
      break;

    case UIMSG_REFRESH:
    {
      UI_SetRefreshMsg(KEY_CHECK_REFRESH);
      /* Blank both display */
      DISP_ClearAll();

      if(KPD_IsPressed(KPD_KEY_DIG0) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-0", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG1) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-1", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG2) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-2", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG3) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-3", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG4) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-4", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG5) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-5", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG6) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-6", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG7) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-7", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG8) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-8", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DIG9) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("KEY-9", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_ADD) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("ADD", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_ADD_UV) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("AD-UV", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_VALM) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("VALUE", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_UV) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("UV", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_AUTO) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("AUTO", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_MANUAL) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("MANL", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_MODE) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("MODE", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_FUNC) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("FUNC", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_UP) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("UP", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_DOWN) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("DOWN", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_BACK) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("BACK", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_NEXT) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("NEXT", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_ENT) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("ENTER", 0);
      }
      else
      if(KPD_IsPressed(KPD_KEY_CLR) == KEY_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("CLEAR", 0);
      }
      else
      if(SW_IsPressed(SW_RESET) == SW_STATE_PRESSED)
      {
        BSP_EnableBuzzer(BEEP_ON_TIME);
        DISP_UpperPutStr("RESET", 0);
      }
      else
      {
        UI_MSG_T msg = {0, UIMSG_INIT};

        UI_SetRefreshMsg(0);
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WELCOME_MSG];
		
        return(SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

    default:
      break;
  }

  return UI_RC_CONTINUE;

#undef KEY_CHECK_REFRESH
#undef BEEP_ON_TIME
}


/**
  * @brief  Internal Process Function for displaying Welcome Mesaage at Power ON
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeWelcomeMsg(void *param, UI_MSG_T *pMsg)
{
#define WELCOME_MSG_INTERVAL   (250)

  static uint8_t msgStartCharNo, msgStartDispNo, msgNbDispChar;
  static const char *pStrWelcomeMsg = "WELCOME";//(char *)FLASH_DATA_START_PHYSICAL_ADDRESS;
  uint32_t powerOnDone = FALSE;
  REG_GetValue(&powerOnDone, REG_ID_POWER_ON_FLAG);

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      uint8_t msgLen = (uint8_t)strlen(pStrWelcomeMsg);

      /* only the First Character is to be displayed on start*/
      msgStartCharNo = 0;
      msgStartDispNo = (uint8_t)(DISP_UPPER_MAX_NB - 1);
      msgNbDispChar = DISP_UPPER_MAX_NB - msgStartDispNo;

      DISP_ClearAll();

      if(msgLen > 0)
      {
        DISP_UpperPutStr((char *)&pStrWelcomeMsg[msgStartCharNo], msgStartDispNo);
      }

      UI_SetRefreshMsg(WELCOME_MSG_INTERVAL);
    }
    break;

    case UIMSG_REFRESH:
    {
      uint8_t msgLen = (uint8_t)strlen(pStrWelcomeMsg);

      if(msgStartCharNo < msgLen)
      {
        if(msgStartDispNo > 0)
        {
          msgStartDispNo--;
          msgNbDispChar = (uint8_t)(DISP_UPPER_MAX_NB - msgStartDispNo);
        }
        else
        {
          msgStartCharNo++;
          msgNbDispChar = (uint8_t)((msgLen - msgStartCharNo) < DISP_UPPER_MAX_NB ?
                                    (msgLen - msgStartCharNo) : DISP_UPPER_MAX_NB);
        }

        DISP_ClearAll();
        DISP_UpperPutStr((char *)&pStrWelcomeMsg[msgStartCharNo], msgStartDispNo);
        UI_SetRefreshMsg(WELCOME_MSG_INTERVAL);
      }
      else
      {
        if(powerOnDone == FALSE)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_START];
          
          return(SwitchHomeSubProcess(param, &msg));
        }
        else
        {
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
          
          return(SwitchHomeSubProcess(param, pMsg));
        }
      }
    }
    break;

    case UIMSG_SW_RESET:
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        if(powerOnDone == FALSE)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};
  
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_START];
  
          return(SwitchHomeSubProcess(param, &msg));
        }
        else
        {
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
          
          return(SwitchHomeSubProcess(param, pMsg));
        }
      }
      break;

    default:
      if(powerOnDone == TRUE)
      {
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
        
        return(SwitchHomeSubProcess(param, pMsg));
      }
      break;
  }

  return UI_RC_CONTINUE;

#undef WELCOME_MSG_INTERVAL
}

/**
  * @brief  Internal Process Function for Starting the Power On Test
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeTestStart(void *param, UI_MSG_T *pMsg)
{
#define CAM_SW_TIMEOUT    (3000)

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      /* Blank both display */
      DISP_ClearAll();

      BSP_H_MotorEnable(TRUE);

      UI_SetRefreshMsg(CAM_SW_TIMEOUT);
    }
    break;

    case UIMSG_REFRESH:
    {
      UI_MSG_T msg = {0, UIMSG_INIT};

      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_01];

      BSP_H_MotorEnable(FALSE);

      return(SwitchHomeSubProcess(param, &msg));
    }
    //break;

    case UIMSG_SW_CAM:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};

        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_END];

        /* Hopper Position to normal,
           Turn Off H-Motor, Turn On S-Motor & Pump */
        BSP_H_MotorEnable(FALSE);

        return(SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

    default:
      break;
  }

  return UI_RC_CONTINUE;

#undef CAM_SW_TIMEOUT
#undef CAM_ERR_TIMEOUT
#undef MOTOR_FREE_RUN
}

/**
  * @brief  Internal Process Function for Ending the Power On Test
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeTestEnd(void *param, UI_MSG_T *pMsg)
{
#define MOTOR_FREE_RUN    (1500)

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      BSP_S_MotorEnable(TRUE);
      BSP_V_PumpEnable(TRUE);

      UI_SetRefreshMsg(MOTOR_FREE_RUN);
    }
    break;

    case UIMSG_REFRESH:
    {
      UI_MSG_T msg = {0, UIMSG_INIT};
      
      uint32_t powerOnDone = TRUE;
      REG_SetValue(&powerOnDone, REG_ID_POWER_ON_FLAG);
    
      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];

      BSP_S_MotorEnable(FALSE);
      BSP_V_PumpEnable(FALSE);

      return(SwitchHomeSubProcess(param, &msg));
    }
    //break;

    default:
      break;
  }

  return UI_RC_CONTINUE;

#undef MOTOR_FREE_RUN
}

/**
  * @brief  Internal Process Function for IDLE state
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeIdle(void *param, UI_MSG_T *pMsg)
{
#define AUTO_ON_BUZZ_TIME    200
#define DISPLAY_UPDATE_MS    1000
#define STANDBY_UPDATE_MS    180000  /* 3 Minutes */ 

  static uint16_t standbyTimeCount = 0;
  uint8_t cntMode = COUNTER_GetMode();

  switch(pMsg->message)
  {
    case UIMSG_INIT:
      standbyTimeCount = 0;
    case UIMSG_REFRESH:
      standbyTimeCount++;
      if(standbyTimeCount > STANDBY_UPDATE_MS / DISPLAY_UPDATE_MS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
    
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WELCOME_MSG];

        return(SwitchHomeSubProcess(param, &msg));
      }
      else
      {
        /* Added to update display */
        UI_SetRefreshMsg(DISPLAY_UPDATE_MS);
      }
      break;

    case UIMSG_KEY_AUTO:
    {
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        uint8_t flagAutoCount = AUTO_GetFlag();
        
        flagAutoCount = (uint8_t)((flagAutoCount == TRUE) ? (FALSE) : (TRUE));
        AUTO_SetFlag(flagAutoCount);
      }
      standbyTimeCount = 0;
    }
    break;

    case UIMSG_KEY_MANUAL:
    {
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        uint8_t flagAutoCount = AUTO_GetFlag();
        
        flagAutoCount = (uint8_t)((flagAutoCount == TRUE) ? (FALSE) : (TRUE));
        AUTO_SetFlag(flagAutoCount);
      }
      standbyTimeCount = 0;
    }
    break;
	
    case UIMSG_KEY_ADD:
    {
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if(cntMode != COUNT_MODE_V)
        {
          if(SW_IsPressed(SW_RESET) == SW_PRESSED)
          {
            UI_MSG_T msg = {0, UIMSG_INIT};
        
            uint32_t accSensorCount = 0;
            REG_SetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
            
            pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WRITE_MEMORY];
  
            return(SwitchHomeSubProcess(param, &msg));
          }
          else
          {
            uint8_t flagAddCount = ADD_GetFlag();
            flagAddCount = (uint8_t)((flagAddCount == TRUE) ? (FALSE) : (TRUE));
            ADD_SetFlag(flagAddCount);
            SENSOR_SetCount(0);
          }
        }
      }
      standbyTimeCount = 0;
    }
    break;

    case UIMSG_KEY_ADD_UV:
    {
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if(SW_IsPressed(SW_RESET) == SW_PRESSED)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};
      
          uint32_t accSensorCount = 0;
          REG_SetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
          
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WRITE_MEMORY];

          return(SwitchHomeSubProcess(param, &msg));
        }
        else
        {
          uint32_t flagUVEnable = 0;
          REG_GetValue(&flagUVEnable, REG_ID_UV_EN_FLAG);
  
          if(flagUVEnable == TRUE)
          {
            uint8_t flagUVDetect = UV_GetDetectFlag();
            uint8_t flagAddCount = ADD_GetFlag();
           
            if((flagUVDetect == FALSE) && (flagAddCount == FALSE))
            {
              flagAddCount = TRUE;
            }
            else if((flagUVDetect == FALSE) && (flagAddCount == TRUE))
            {
              flagUVDetect = TRUE;
              flagAddCount = FALSE;
            }
            else if((flagUVDetect == TRUE) && (flagAddCount == FALSE))
            {
              flagAddCount = TRUE;
            }

            else
            {
              flagUVDetect = FALSE;
              flagAddCount = FALSE;
            }

            UV_SetDetectFlag(flagUVDetect);
            ADD_SetFlag(flagAddCount);
          }
          else
          {
            uint8_t flagAddCount = ADD_GetFlag();
  
            flagAddCount = (uint8_t)((flagAddCount == TRUE) ? (FALSE) : (TRUE));
            ADD_SetFlag(flagAddCount);
          }
        }
      }
      standbyTimeCount = 0;
    }
    break;
    
    case UIMSG_KEY_FUNC:
    {
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if(SW_IsPressed(SW_RESET) == SW_PRESSED)
        {
          if(UI_GetMenuNbTotalChild(UI_MENU_MAIN_ID) > 0)
          {
            UI_InvokeMenu(UI_MENU_MAIN_ID);

            UI_SetRefreshMsg(0);
            
            SENSOR_SetCount(0);
            return UI_RC_FINISH;
          }
        }
      }
      standbyTimeCount = 0;
    }
    break;
        
    case UIMSG_KEY_MODE:
    {
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if(SW_IsPressed(SW_RESET) == SW_PRESSED)
        {
          if(UI_GetMenuNbTotalChild(UI_MENU_MAIN_ID) > 0)
          {
            UI_InvokeMenu(UI_MENU_MAIN_ID);

            UI_SetRefreshMsg(0);
            
            SENSOR_SetCount(0);
            return UI_RC_FINISH;
          }
        }
        else
        {
          uint32_t stampEnable = 0;
          uint8_t flagValueEnable = VALUE_GetFlag();
          uint8_t flagAddCount = ADD_GetFlag();

          REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);

          cntMode++;
          cntMode = (uint8_t)(((cntMode == COUNT_MODE_S) && (stampEnable == FALSE)) ?
                              (cntMode + 1) : (cntMode));

          cntMode %= COUNT_MODE_MAX;
			
          cntMode = (uint8_t)(((cntMode == COUNT_MODE_V) && (flagValueEnable == FALSE)) ?
                              (cntMode + 1) : (cntMode));

          cntMode %= COUNT_MODE_MAX;
			
          flagAddCount = (uint8_t)(((cntMode == COUNT_MODE_V) && (flagValueEnable == TRUE)) ?
                                   (FALSE) : (flagAddCount));
          
          ADD_SetFlag(flagAddCount);

          COUNTER_SetMode(cntMode);
          SENSOR_SetCount(0);
        }
      }
      standbyTimeCount = 0;
    }
    break;

    case UIMSG_KEY_UV:
    {
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        uint32_t flagUVEnable = 0;
        REG_GetValue(&flagUVEnable, REG_ID_UV_EN_FLAG);

        if(flagUVEnable == TRUE)
        {
          uint8_t flagUVDetect = UV_GetDetectFlag();
          flagUVDetect = (uint8_t)((flagUVDetect == TRUE) ? (FALSE) : (TRUE));
          UV_SetDetectFlag(flagUVDetect);
        }
      }
      standbyTimeCount = 0;
    }
    break;

    case UIMSG_KEY_VALM:
    {
      if((uint8_t)pMsg->param == UI_KEY_RELEASE)
      {
        uint8_t flagAddCount = ADD_GetFlag();
          
        if(cntMode == COUNT_MODE_V)
        {
          cntMode = COUNT_MODE_C;
        }
        else
        {
          cntMode = COUNT_MODE_V;
        }
        
        flagAddCount = (uint8_t)((cntMode == COUNT_MODE_V) ? FALSE : flagAddCount);
        ADD_SetFlag(flagAddCount);
        
        COUNTER_SetMode(cntMode);
        SENSOR_SetCount(0);
      }
      standbyTimeCount = 0;
    }
    break;

    case UIMSG_SW_AUTO:
    {
      uint8_t flagAutoCount = AUTO_GetFlag();

      if(flagAutoCount == TRUE)
      {
        if((uint8_t)pMsg->param == UI_SW_PRESS)
        {
          /* Auto Start */
          UI_MSG_T msg = {0, UIMSG_INIT};

          BSP_EnableBuzzer(AUTO_ON_BUZZ_TIME);

          UI_SetRefreshMsg(0);
          SENSOR_SetCount(0);
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_H_MOTOR];
          return(SwitchHomeSubProcess(param, &msg));
        }
      }
      standbyTimeCount = 0;
    }
    break;

    case UIMSG_KEY_ENT:
    {
      uint8_t flagAutoCount = AUTO_GetFlag();

      if(flagAutoCount == FALSE)
      {
        if((uint8_t)pMsg->param == UI_KEY_PRESS)
        {
          /* Manual Start */
          UI_MSG_T msg = {0, UIMSG_INIT};

          UI_SetRefreshMsg(0);
          SENSOR_SetCount(0);
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_H_MOTOR];
          return(SwitchHomeSubProcess(param, &msg));
        }
      }
      standbyTimeCount = 0;
    }
    break;

    case UIMSG_KEY_DIG0:
    case UIMSG_KEY_DIG1:
    case UIMSG_KEY_DIG2:
    case UIMSG_KEY_DIG3:
    case UIMSG_KEY_DIG4:
    case UIMSG_KEY_DIG5:
    case UIMSG_KEY_DIG6:
    case UIMSG_KEY_DIG7:
    case UIMSG_KEY_DIG8:
    case UIMSG_KEY_DIG9:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if((cntMode == COUNT_MODE_C) ||
           (cntMode == COUNT_MODE_B))
        {
          UI_SetRefreshMsg(0);
          SENSOR_SetCount(0);

          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_EDIT];
          return(SwitchHomeSubProcess(param, pMsg));
        }
        else if(cntMode == COUNT_MODE_V)
        {
          uint32_t noteVCount = 0;
          REG_GetValue(&noteVCount, REG_ID_NOTE_V_COUNT);
          SENSOR_SetCount(0);

          if(pMsg->message == UIMSG_KEY_V10)
          {
            noteVCount = 10;
          }
          else if(pMsg->message == UIMSG_KEY_V20)
          {
            noteVCount = 20;
          }
          else if(pMsg->message == UIMSG_KEY_V50)
          {
            noteVCount = 50;
          }
          else if(pMsg->message == UIMSG_KEY_V100)
          {
            noteVCount = 100;
          }
          else if(pMsg->message == UIMSG_KEY_V500)
          {
            noteVCount = 500;
          }
          else if(pMsg->message == UIMSG_KEY_V1000)
          {
            noteVCount = 1000;
          }

          REG_SetValue(&noteVCount, REG_ID_NOTE_V_COUNT);
        }
        standbyTimeCount = 0;
      }
      break;

    case UIMSG_KEY_TENS:
    case UIMSG_KEY_UNITS:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        if((cntMode == COUNT_MODE_C) ||
           (cntMode == COUNT_MODE_B))
        {
          UI_SetRefreshMsg(0);
          SENSOR_SetCount(0);

          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_EDIT];
          return(SwitchHomeSubProcess(param, pMsg));
        }
        standbyTimeCount = 0;
      }

      break;

    case UIMSG_SW_RESET:
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        uint8_t cntMode = COUNTER_GetMode();

        if(cntMode == COUNT_MODE_V)
        {
          uint32_t valueCounter = 0;
          REG_SetValue(&valueCounter, REG_ID_VALUE_COUNTER);
        }
        
        standbyTimeCount = 0;
      }
      break;

    default:
      break;
  }

  HomeDispCounter();

  return UI_RC_CONTINUE;

#undef AUTO_ON_BUZZ_TIME
#undef DISPLAY_UPDATE_MS
#undef STANDBY_UPDATE_MS
}

/**
  * @brief  Internal Process Function for Edit state
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeEdit(void *param, UI_MSG_T *pMsg)
{
#define KEY_INVALID 0xFF
#define KEY_TENS    0x80
#define KEY_UNITS   0x40

  static uint32_t EditVal = 0;
  char string[8];
  uint8_t digitVal = KEY_INVALID;
  uint32_t EditMinVal = 0, EditMaxVal = 0;

  uint8_t cntMode = COUNTER_GetMode();

  if(cntMode == COUNT_MODE_C)
  {
    REG_GetMinValue(&EditMinVal, REG_ID_NOTE_C_COUNT);
    REG_GetMaxValue(&EditMaxVal, REG_ID_NOTE_C_COUNT);
  }
  else if(cntMode == COUNT_MODE_B)
  {
    REG_GetMinValue(&EditMinVal, REG_ID_NOTE_B_COUNT);
    REG_GetMaxValue(&EditMaxVal, REG_ID_NOTE_B_COUNT);
  }

  switch(pMsg->message)
  {
    case UIMSG_KEY_DIG0:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 0;
      }
      break;

    case UIMSG_KEY_DIG1:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 1;
      }
      break;

    case UIMSG_KEY_DIG2:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 2;
      }
      break;

    case UIMSG_KEY_DIG3:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 3;
      }
      break;

    case UIMSG_KEY_DIG4:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 4;
      }
      break;

    case UIMSG_KEY_DIG5:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 5;
      }
      break;

    case UIMSG_KEY_DIG6:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 6;
      }
      break;

    case UIMSG_KEY_DIG7:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 7;
      }
      break;

    case UIMSG_KEY_DIG8:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 8;
      }
      break;

    case UIMSG_KEY_DIG9:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = 9;
      }
      break;

    case UIMSG_KEY_TENS:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = KEY_TENS;
      }
      break;

    case UIMSG_KEY_UNITS:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        digitVal = KEY_UNITS;
      }
      break;

    case UIMSG_KEY_CLR:
    case UIMSG_SW_RESET:
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        if(EditVal < 10)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};

          EditVal = 0;

          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
          return(SwitchHomeSubProcess(param, &msg));
        }
        else
        {
          EditVal /= 10;
        }
      }
      break;

    case UIMSG_KEY_ENT:
      if((uint8_t)pMsg->param == UI_KEY_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        uint8_t cntMode = COUNTER_GetMode();

        if(cntMode == COUNT_MODE_C)
        {
          REG_SetValue(&EditVal, REG_ID_NOTE_C_COUNT);
        }
        else if(cntMode == COUNT_MODE_B)
        {
          REG_SetValue(&EditVal, REG_ID_NOTE_B_COUNT);
        }

        EditVal = 0;

        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
        return(SwitchHomeSubProcess(param, &msg));
      }
      break;

    default:
      break;
  }

  if(digitVal != KEY_INVALID)
  {
    if(digitVal == KEY_TENS)
    {
      if((EditVal + 10) <= EditMaxVal)
      {
        EditVal += 10;
      }
      else
      {
        EditVal = 0;
      }
    }
    else if (digitVal == KEY_UNITS)
    {
      if(EditVal % 10 == 9)
      {
        EditVal -= 9;
      }
      else
      {
        if((EditVal + 1) <= EditMaxVal)
        {
          EditVal += 1;
        }
        else
        {
          EditVal = 0;
        }
      }
    }
    else
    {
      if(((EditVal * 10) + digitVal) <= EditMaxVal)
      {
        EditVal = (EditVal * 10) + digitVal;
      }      
    }
  }

  DISP_LowerClear();

  sprintf(&string[0], DISP_LOWER_STR_FORMAT, EditVal);
  DISP_LowerPutStr(&string[0], 0);

  return UI_RC_CONTINUE;

#undef KEY_INVALID
#undef KEY_TENS
#undef KEY_UNITS
}

/**
  * @brief  Internal Process Function for Home Start H Motor
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeStartHMotor(void *param, UI_MSG_T *pMsg)
{
#define CAM_SW_TIMEOUT    (3000)

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      uint8_t flagUVDetect = UV_GetDetectFlag();
      uint32_t sensorCounter = 0;

      SENSOR_SetCount(sensorCounter);

      if(flagUVDetect == TRUE)
      {
        BSP_UV_DetectEnable(TRUE);
      }

      BSP_H_MotorEnable(TRUE);
      BSP_V_PumpEnable(TRUE);

      UI_SetRefreshMsg(CAM_SW_TIMEOUT);
    }
    break;

    case UIMSG_REFRESH:
    {
      uint8_t flagUVDetect = UV_GetDetectFlag();
      UI_MSG_T msg = {0, UIMSG_INIT};

      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_01];

      if(flagUVDetect == TRUE)
      {
        BSP_UV_DetectEnable(FALSE);
      }

      BSP_H_MotorEnable(FALSE);
      BSP_V_PumpEnable(FALSE);

      return(SwitchHomeSubProcess(param, &msg));
    }
    //break;

    case UIMSG_SW_CAM:
    {
      if((uint8_t)pMsg->param == UI_SW_RELEASE)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_S_MOTOR];

        /* Hopper Position Set, Turn Off H-Motor, Turn On S-Motor & Pump */
        BSP_H_MotorEnable(FALSE);
        UI_SetRefreshMsg(0);

        return(SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

    case UIMSG_SW_RESET:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        uint8_t flagUVDetect = UV_GetDetectFlag();
        UI_MSG_T msg = {0, UIMSG_INIT};

        UI_SetRefreshMsg(0);

        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

        if(flagUVDetect == TRUE)
        {
          BSP_UV_DetectEnable(FALSE);
        }

        BSP_H_MotorEnable(FALSE);
        BSP_V_PumpEnable(FALSE);

        return(SwitchHomeSubProcess(param, &msg));
      }
    }
    break;
  }

  return UI_RC_CONTINUE;

#undef CAM_SW_TIMEOUT
}

/**
  * @brief  Internal Process Function for Home Start S Motor
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeStartSMotor(void *param, UI_MSG_T *pMsg)
{
#define SENSOR_TIMEOUT  (500)
//  char string[8];

  uint32_t accSensorCount = 0;
  uint8_t flagAutoCount = AUTO_GetFlag();
  uint8_t flagAddCount = ADD_GetFlag();
  uint8_t flagUVDetect = UV_GetDetectFlag();
  uint8_t cntMode = COUNTER_GetMode();
  uint32_t sensorCounter = SENSOR_GetCount();
  
  REG_GetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      SENSOR_SetEnable(TRUE);
      BSP_S_MotorEnable(TRUE);

      UI_SetRefreshMsg(SENSOR_TIMEOUT);
    }
    break;

    case UIMSG_UVDETECT:
    {
      UI_MSG_T msg = {0, UIMSG_INIT};
      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_B_COIL];

      UI_SetRefreshMsg(0);

      BSP_S_MotorEnable(FALSE);
      BSP_V_PumpEnable(FALSE);

      SENSOR_SetEnable(FALSE);

      if(flagUVDetect == TRUE)
      {
        BSP_UV_DetectEnable(FALSE);
      }

      return(SwitchHomeSubProcess(param, &msg));
    }
    //break;

    case UIMSG_COUNTER:
    {
      if(cntMode == COUNT_MODE_B)
      {
        uint32_t noteSetCount = 0;
        REG_GetValue(&noteSetCount, REG_ID_NOTE_B_COUNT);

        if(sensorCounter >= noteSetCount)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};

          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_B_COIL];

          UI_SetRefreshMsg(0);

          if(flagUVDetect == TRUE)
          {
            BSP_UV_DetectEnable(FALSE);
          }

          BSP_S_MotorEnable(FALSE);
          BSP_V_PumpEnable(FALSE);

          SENSOR_SetEnable(FALSE);

          return(SwitchHomeSubProcess(param, &msg));
        }
      }

      UI_SetRefreshMsg(SENSOR_TIMEOUT);
    }
    break;

    case UIMSG_REFRESH:
    {
      /* Check Count if zero, Display Error
         If in Verify Mode & Less Then Verify Count, Blink and beep, else release hopper
         If Batch Mode & Less Then Batch Count, Blink and Beep, else press batch coil & hopper
         If in free Mode display Count and Release Hopper.
      */
      if(flagUVDetect == TRUE)
      {
        BSP_UV_DetectEnable(FALSE);
      }

      BSP_S_MotorEnable(FALSE);
      BSP_V_PumpEnable(FALSE);

      SENSOR_SetEnable(FALSE);

      if(sensorCounter == 0)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_02];

        return(SwitchHomeSubProcess(param, &msg));
      }
      else
      {
        if(cntMode == COUNT_MODE_C)
        {
          uint32_t noteSetCount = 0;
          REG_GetValue(&noteSetCount, REG_ID_NOTE_C_COUNT);

          if(sensorCounter == noteSetCount)
          {
            uint32_t VerifyTrueCount = 0;

            UI_MSG_T msg = {0, UIMSG_INIT};
            pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

            REG_GetValue(&VerifyTrueCount, REG_ID_C_TRUE_COUNT);
            VerifyTrueCount++;
            REG_SetValue(&VerifyTrueCount, REG_ID_C_TRUE_COUNT);

            return(SwitchHomeSubProcess(param, &msg));
          }
          else
          {
            UI_MSG_T msg = {0, UIMSG_INIT};
            pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];

            if(sensorCounter < noteSetCount)
            {
              uint32_t VerifyUnderCount = 0;
              REG_GetValue(&VerifyUnderCount, REG_ID_C_UNDER_COUNT);
              VerifyUnderCount++;
              REG_SetValue(&VerifyUnderCount, REG_ID_C_UNDER_COUNT);
            }
            else
            {
              uint32_t VerifyOverCount = 0;
              REG_GetValue(&VerifyOverCount, REG_ID_C_OVER_COUNT);
              VerifyOverCount++;
              REG_SetValue(&VerifyOverCount, REG_ID_C_OVER_COUNT);
            }

            return(SwitchHomeSubProcess(param, &msg));
          }
        }
        else if(cntMode == COUNT_MODE_B)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];

          return(SwitchHomeSubProcess(param, &msg));
        }
        else if(cntMode == COUNT_MODE_F)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
					
          return(SwitchHomeSubProcess(param, &msg));
        }
        else if(cntMode == COUNT_MODE_S)
        {
          uint32_t noteSetCount = 0;
          REG_GetValue(&noteSetCount, REG_ID_NOTE_S_COUNT);

          if(sensorCounter == noteSetCount)
          {
            UI_MSG_T msg = {0, UIMSG_INIT};
            pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_S_COIL];

            return(SwitchHomeSubProcess(param, &msg));
          }
          else
          {
            UI_MSG_T msg = {0, UIMSG_INIT};
            pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];

            return(SwitchHomeSubProcess(param, &msg));
          }
        }
        else if(cntMode == COUNT_MODE_V)
        {
          UI_MSG_T msg = {0, UIMSG_INIT};
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

          return(SwitchHomeSubProcess(param, &msg));
        }
      }
    }
    break;

    case UIMSG_SW_RESET:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        
        UI_SetRefreshMsg(0);

        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

        if(flagUVDetect == TRUE)
        {
          BSP_UV_DetectEnable(FALSE);
        }

        BSP_S_MotorEnable(FALSE);
        BSP_V_PumpEnable(FALSE);
        
        SENSOR_SetEnable(FALSE);

        return(SwitchHomeSubProcess(param, &msg));
      }
    }
    break;
  }

  HomeDispCounter();

  return UI_RC_CONTINUE;

#undef SENSOR_TIMEOUT
}

/**
  * @brief  Internal Process Function for Home Start B Coil
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeStartBCoil(void *param, UI_MSG_T *pMsg)
{
#define BATCH_COIL_TIME  (500)

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      BSP_B_CoilEnable(TRUE);

      UI_SetRefreshMsg(BATCH_COIL_TIME);
    }
    break;

    case UIMSG_REFRESH:
    {
      uint8_t flagUVDetect = UV_GetDetectFlag();

      BSP_B_CoilEnable(FALSE);

      if(flagUVDetect == TRUE)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];

        return (SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

    case UIMSG_SW_RESET:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        
        BSP_B_CoilEnable(FALSE);
				
        UI_SetRefreshMsg(0);
				
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

        return (SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

  }

  HomeDispCounter();

  return UI_RC_CONTINUE;

#undef BATCH_COIL_TIME
}

/**
  * @brief  Internal Process Function for Home Start S Coil
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeStartSCoil(void *param, UI_MSG_T *pMsg)
{
#define STAMP_COIL_TIME  (500)

  uint32_t stampEnable = FALSE;
  REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
  
  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      if(stampEnable == TRUE)
      {
        BSP_S_CoilEnable(TRUE);
      }

      UI_SetRefreshMsg(STAMP_COIL_TIME);
    }
    break;

    case UIMSG_REFRESH:
    {
      UI_MSG_T msg = {0, UIMSG_INIT};
      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

      if(stampEnable == TRUE)
      {
        BSP_S_CoilEnable(FALSE);
      }

      return (SwitchHomeSubProcess(param, &msg));
    }
    //break;

    case UIMSG_SW_RESET:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        
        UI_SetRefreshMsg(0);

        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

        if(stampEnable == TRUE)
        {
          BSP_S_CoilEnable(FALSE);
        }
				
        return (SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

  }

  HomeDispCounter();

  return UI_RC_CONTINUE;

#undef STAMP_COIL_TIME
}

/**
  * @brief  Internal Process Function for Home Stop H Motor
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeStopHMotor(void *param, UI_MSG_T *pMsg)
{
#define CAM_SW_TIMEOUT    (3000)

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      UI_SetRefreshMsg(CAM_SW_TIMEOUT);
      BSP_H_MotorEnable(TRUE);
    }
    break;
    
    case UIMSG_SW_RESET:
    break;

    case UIMSG_REFRESH:
    {
      UI_MSG_T msg = {0, UIMSG_INIT};
      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_01];

      BSP_H_MotorEnable(FALSE);
			
      return(SwitchHomeSubProcess(param, &msg));
    }
    //break;

    case UIMSG_SW_CAM:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};
        uint32_t accSensorCount = 0;
        uint32_t sensorCounter = SENSOR_GetCount();
        uint8_t flagAddCount = ADD_GetFlag();
        uint8_t cntMode = COUNTER_GetMode();
      
        /* Hopper Position Set, Turn OFF H-Motor */
        BSP_H_MotorEnable(FALSE);
        UI_SetRefreshMsg(0);
      
        REG_GetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
        
        if(flagAddCount == TRUE)
        {
          if(cntMode == COUNT_MODE_C)
          {
            uint32_t noteSetCount = 0;
            REG_GetValue(&noteSetCount, REG_ID_NOTE_C_COUNT);
  
            if(sensorCounter == noteSetCount)
            {
              accSensorCount += sensorCounter;
            }
          }
          else if(cntMode == COUNT_MODE_B)
          {
            uint32_t noteSetCount = 0;
            REG_GetValue(&noteSetCount, REG_ID_NOTE_B_COUNT);
  
            if(sensorCounter == noteSetCount)
            {
              accSensorCount += sensorCounter;
            }
          }
          else if(cntMode == COUNT_MODE_F)
          {
            accSensorCount += sensorCounter;
          }
          else if(cntMode == COUNT_MODE_S)
          {
            uint32_t noteSetCount = 0;
            REG_GetValue(&noteSetCount, REG_ID_NOTE_S_COUNT);
  
            if(sensorCounter == noteSetCount)
            {
              accSensorCount += sensorCounter;
            }
          }
  
          else if(cntMode == COUNT_MODE_V)
          {
            uint32_t noteSetCount = 0;
            REG_GetValue(&noteSetCount, REG_ID_NOTE_V_COUNT);
  
            accSensorCount += (sensorCounter * noteSetCount);
          }
  
          REG_SetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
        }
  
        if(cntMode == COUNT_MODE_V)
        {
          uint32_t valueCounter = 0, noteSetCount = 0;
  
          REG_GetValue(&valueCounter, REG_ID_VALUE_COUNTER);
          REG_GetValue(&noteSetCount, REG_ID_NOTE_V_COUNT);
  
          valueCounter += (sensorCounter * noteSetCount);
          REG_SetValue(&valueCounter, REG_ID_VALUE_COUNTER);
        }

        if(flagAddCount == TRUE)
        {
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WRITE_MEMORY];
        }
        else
        {
          pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
        }
				
        return (SwitchHomeSubProcess(param, &msg));
      }
    }
    break;
    
    default:
    break;
  }

  HomeDispCounter();

  return UI_RC_CONTINUE;

#undef CAM_SW_TIMEOUT
}

/**
  * @brief  Internal Process Function for Home Write Memory
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeWriteMemory(void *param, UI_MSG_T *pMsg)
{
#define  MEMORY_WRITE_TIME  100

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
 //     DISP_ClearAll();
      
      RET_WriteRetEnbale(TRUE);
/*
      UI_SetRefreshMsg(MEMORY_WRITE_TIME);
    }
    break;

    case UIMSG_REFRESH:
    {
*/
      UI_MSG_T msg = {0, UIMSG_INIT};

//      RET_WriteRetEnbale(FALSE);

      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
      HomeDispCounter();
			
      return (SwitchHomeSubProcess(param, &msg));
    }
    //break;

    default:
      break;
  }

  return UI_RC_CONTINUE;

#undef  MEMORY_WRITE_TIME
}

/**
  * @brief  Internal Process Function for Home Beep
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeBeep(void *param, UI_MSG_T *pMsg)
{
#define BEEP_ON_TIME   (300)
#define BEEP_OFF_TIME  (700)

  static uint8_t BeepOn = FALSE;

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    case UIMSG_REFRESH:
    {
      if(BeepOn == TRUE)
      {
        BeepOn = FALSE;
        HomeDispCounter();

        BSP_DisableBuzzer();
        UI_SetRefreshMsg(BEEP_OFF_TIME);
      }
      else
      {
        BeepOn = TRUE;
        DISP_UpperClear();

        BSP_EnableBuzzer(BEEP_ON_TIME);
        UI_SetRefreshMsg(BEEP_ON_TIME);
      }
    }
    break;

    case UIMSG_SW_RESET:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};

				BeepOn = FALSE;
        BSP_DisableBuzzer();
        
        UI_SetRefreshMsg(0);
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

        return (SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

    default:
      break;
  }

  return UI_RC_CONTINUE;

#undef BEEP_ON_TIME
#undef BEEP_OFF_TIME
}

/**
  * @brief  Internal Process Function for Home Error 01
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeError01(void *param, UI_MSG_T *pMsg)
{
  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      DISP_ClearAll();

      DISP_UpperPutStr("ERR-1", 0);
    }
    break;

    default:
      break;
  }

  return UI_RC_CONTINUE;
}

/**
  * @brief  Internal Process Function for Home Error 02
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
static uint8_t ProcHomeError02(void *param, UI_MSG_T *pMsg)
{
#define BEEP_ON_TIME   (300)
#define BEEP_OFF_TIME  (700)

  static uint8_t BeepOn = FALSE;

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    case UIMSG_REFRESH:
    {
      if(BeepOn == TRUE)
      {
        BeepOn = FALSE;

        BSP_DisableBuzzer();
        UI_SetRefreshMsg(BEEP_OFF_TIME);
      }
      else
      {
        BeepOn = TRUE;

        BSP_EnableBuzzer(BEEP_ON_TIME);
        UI_SetRefreshMsg(BEEP_ON_TIME);
      }
    }
    break;

    case UIMSG_SW_RESET:
    {
      if((uint8_t)pMsg->param == UI_SW_PRESS)
      {
        UI_MSG_T msg = {0, UIMSG_INIT};

        BSP_EnableBuzzer(BEEP_ON_TIME);

        UI_SetRefreshMsg(0);
        pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];

        return (SwitchHomeSubProcess(param, &msg));
      }
    }
    break;

    default:
      break;
  }

  DISP_ClearAll();

  DISP_UpperPutStr("ERR-2", 0);

  return UI_RC_CONTINUE;

#undef BEEP_ON_TIME
#undef BEEP_OFF_TIME
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for Home Process
  * @param  param - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
uint8_t UI_ProcessHome(void *param, UI_MSG_T *pMsg)
{
  uint32_t powerOnDone = 0;

  REG_GetValue(&powerOnDone, REG_ID_POWER_ON_FLAG);

  if(pMsg->message == UIMSG_INIT)
  {
    if(powerOnDone == FALSE)
    {
      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_KPD];
    }
    else
    {
      pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
    }
  }
	
  return (pfProcHome(param, pMsg));
}
/**********************************END OF FILE*********************************/
