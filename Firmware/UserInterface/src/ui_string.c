/**
  ******************************************************************************
  * @file    ui_string.c
  * @author  Vipul Panchal
  * @brief   User Interface String Definition Source File.
  *           + Table declaration for strings
  ******************************************************************************
  */

/** @addtogroup User_Interface
  * @{
  */

/** @addtogroup UI_String
  * @{
  */

/** @addtogroup UI_String_Private_Includes
  * @{
  */

#include "ui.h"

/**
  * @}
  */

/** @addtogroup UI_String_Private_TypesDefinitions
  * @{
  */

/**
  * @}
  */

/** @addtogroup UI_String_Private_Defines
  * @{
  */

/**
  * @}
  */

/** @addtogroup UI_String_Private_Variables
  * @{
  */
static uint8_t StringTypeIdx = 0;

/**
  * @}
  */
  
/** @addtogroup UI_String_Private_Constant_Tables
  * @{
  */

/*
 * UI String List
 */
const char * UI_STRING_LIST[UI_STR_MAX_NB][UI_STR_TYPE_MAX_NB] =
{
  /* UI_STR_KEY_0       */ {"KEY0", "KEY-0", "KEY-0  "},
  /* UI_STR_KEY_1       */ {"KEY1", "KEY-1", "KEY-1  "},
  /* UI_STR_KEY_2       */ {"KEY2", "KEY-2", "KEY-2  "},
  /* UI_STR_KEY_3       */ {"KEY3", "KEY-3", "KEY-3  "},
  /* UI_STR_KEY_4       */ {"KEY4", "KEY-4", "KEY-4  "},
  /* UI_STR_KEY_5       */ {"KEY5", "KEY-5", "KEY-5  "},
  /* UI_STR_KEY_6       */ {"KEY6", "KEY-6", "KEY-6  "},
  /* UI_STR_KEY_7       */ {"KEY7", "KEY-7", "KEY-7  "},
  /* UI_STR_KEY_8       */ {"KEY8", "KEY-8", "KEY-8  "},
  /* UI_STR_KEY_9       */ {"KEY9", "KEY-9", "KEY-9  "},
  /* UI_STR_AUTO        */ {"AUTO", "AUTO ", "AUTO   "},
  /* UI_STR_MANUAL      */ {"MANL", "MANUL", "MANUAL "},
  /* UI_STR_MODE        */ {"MODE", "MODE ", "MODE   "},
  /* UI_STR_FUNCTION    */ {"FUNC", "FUNCN", "FUNCTON"},
  /* UI_STR_UP          */ {"UP  ", "UP   ", "UP     "},
  /* UI_STR_DOWN        */ {"DOWN", "DOWN ", "DOWN   "},
  /* UI_STR_BACK        */ {"BACK", "BACK ", "BACK   "},
  /* UI_STR_NEXT        */ {"NEXT", "NEXT ", "NEXT   "},
  /* UI_STR_TENS        */ {"TENS", "TENS ", "TENS   "},
  /* UI_STR_UNITS       */ {"UNIT", "UNITS", "UNITS  "},
  /* UI_STR_ENTER       */ {"ENT ", "ENTER", "ENTER  "},
  /* UI_STR_CLEAR       */ {"CLR ", "CLEAR", "CLEAR  "},
  /* UI_STR_RESET       */ {"RST ", "RESET", "RESET  "},
  /* UI_STR_SW_AUTO     */ {"SW-I", "SW-I ", "SW-AUTO"},
  /* UI_STR_SW_CAM      */ {"SW-H", "SW-H ", "SW-CAM "},
  /* UI_STR_ADD         */ {"ADD ", "ADD  ", "ADD    "},
  /* UI_STR_UV          */ {"UV  ", "UV   ", "UV     "},
  /* UI_STR_ADD_UV      */ {"A-UV", "AD-UV", "ADD-UV "},
  /* UI_STR_VALUE       */ {"VAL ", "VALUE", "VALUE  "},
  /* UI_STR_COUNT       */ {"CNT ", "COUNT", "COUNT  "},
  /* UI_STR_OVER_COUNT  */ {"O-CT", "O-CNT", "O-COUNT"},
  /* UI_STR_UNDER_COUNT */ {"U-CT", "U-CNT", "U-COUNT"},
  /* UI_STR_ERROR_1     */ {"ERR1", "ERR-1", "ERROR-1"},
  /* UI_STR_ERROR_2     */ {"ERR2", "ERR-2", "ERROR-2"},
  /* UI_STR_EN          */ {"EN  ", "EN   ", "EN     "},
  /* UI_STR_DIS         */ {"DIS ", "DIS  ", "DIS    "},
  /* UI_STR_ENABLE      */ {"ENBL", "ENBLE", "ENABLE "},
  /* UI_STR_DISABLE     */ {"DISB", "DISBL", "DISABLE"},
  /* UI_STR_SETMODE     */ {"SETM", "SET-M", "SET-MOD"},
  /* UI_STR_COUNT_LOG   */ {"CLOG", "C-LOG", "CNT-LOG"},
  /* UI_STR_STAMP       */ {"STMP", "STAMP", "STAMP  "},
  /* UI_STR_UVSET       */ {"UVST", "UVSET", "UV-SET "},
  /* UI_STR_MSG_SET     */ {"MSG ", "MSGST", "MSG-SET"},
  /* UI_STR_MOTOR       */ {"MOTR", "MOTOR", "MOTOR  "},
  /* UI_STR_COIL        */ {"COIL", "COIL ", "COIL   "},
  /* UI_STR_KEYBOARD    */ {"KBRD", "KYBRD", "KEYBRD "},
  /* UI_STR_SWITCH      */ {"SWTH", "SWTCH", "SWITCH "},
  /* UI_STR_SEGMENT     */ {"SEG ", "SEG  ", "SEGMENT"},
  /* UI_STR_PUMP        */ {"PUMP", "PUMP ", "PUMP   "},
  /* UI_STR_HOPPER      */ {"HPPR", "HOPPR", "HOPPER "},
  /* UI_STR_SPINDLE     */ {"SMOT", "S MOT", "SPINDLE"},
  /* UI_STR_BCOIL       */ {"BCOL", "BCOIL", "B-COIL "},
  /* UI_STR_SCOIL       */ {"SCOL", "SCOIL", "S-COIL "},
};

/**
  * @}
  */

/** @addtogroup UI_String_Public_Functions
  * @{
  */
  
/**
  * @brief  Set the String Type
  * @param  strTypeIdx - String Type Index No.
  * @retval None 
  */
void UI_SetStringType(uint8_t strTypeIdx)
{
  if(strTypeIdx < UI_STR_TYPE_MAX_NB)
  {
    StringTypeIdx = strTypeIdx;
  }
  else
  {
    StringTypeIdx = 0;
  }
}

/**
  * @brief  Returns the requested string
  * @param  strIdx - String Index No.
  * @retval Pointer to the String 
  */
const char * UI_GetString(uint8_t strIdx)
{
  if(strIdx < UI_STR_MAX_NB)
  {
    return (UI_STRING_LIST[strIdx][StringTypeIdx]);
  }
  else
  {
    return (NULL);
  }
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

/**********************************END OF FILE*********************************/
