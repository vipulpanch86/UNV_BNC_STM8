/**
  ******************************************************************************
  * @file    ui_string.h
  * @author  Vipul Panchal
  * @brief   This file contains String Definition related to 
  *          User Interface
  ******************************************************************************
  */

/** @addtogroup User_Interface
  * @{
  */

/** @addtogroup UI_String
  * @{
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __UI_STRING_H
#define __UI_STRING_H

#ifdef __cplusplus
extern "C" {
#endif

/** @addtogroup UI_String_Includes
  * @{
  */
/**
  * @}
  */


/** @addtogroup UI_String_Exported_Types
  * @{
  */
/* String Type Enumeration */
typedef enum UI_STRING_TYPE_T 
{
  UI_STR_TYPE_SIZE_4,
  UI_STR_TYPE_SIZE_5,
  UI_STR_TYPE_SIZE_7,

  UI_STR_TYPE_MAX_NB
};

/* String Enumeration */
typedef enum UI_STRING_T 
{
  UI_STR_KEY_0,
  UI_STR_KEY_1,
  UI_STR_KEY_2,
  UI_STR_KEY_3,
  UI_STR_KEY_4,
  UI_STR_KEY_5,
  UI_STR_KEY_6,
  UI_STR_KEY_7,
  UI_STR_KEY_8,
  UI_STR_KEY_9,
  UI_STR_AUTO,
  UI_STR_MANUAL,
  UI_STR_MODE,
  UI_STR_FUNCTION,
  UI_STR_UP,
  UI_STR_DOWN,
  UI_STR_BACK,
  UI_STR_NEXT,
  UI_STR_TENS,
  UI_STR_UNITS,
  UI_STR_ENTER,
  UI_STR_CLEAR,
  UI_STR_RESET,
  UI_STR_SW_AUTO,
  UI_STR_SW_CAM,
  UI_STR_ADD,
  UI_STR_UV,
  UI_STR_ADD_UV,
  UI_STR_VALUE,
  UI_STR_COUNT,
  UI_STR_OVER_COUNT,
  UI_STR_UNDER_COUNT,
  UI_STR_ERROR_1,
  UI_STR_ERROR_2,
  UI_STR_EN,
  UI_STR_DIS,
  UI_STR_ENABLE,
  UI_STR_DISABLE,
  UI_STR_SETMODE,
  UI_STR_COUNT_LOG,
  UI_STR_STAMP,
  UI_STR_UVSET,
  UI_STR_MSG_SET,
  UI_STR_MOTOR,
  UI_STR_COIL,
  UI_STR_KEYBOARD,
  UI_STR_SWITCH,
  UI_STR_SEGMENT,
  UI_STR_PUMP,
  UI_STR_HOPPER,
  UI_STR_SPINDLE,
  UI_STR_BCOIL,
  UI_STR_SCOIL,
  
  UI_STR_MAX_NB
};


/**
  * @}
  */

/** @addtogroup UI_String_Exported_Constants
  * @{
  */

/**
  * @}
  */

/** @addtogroup UI_String_Exported_Macros
  * @{
  */

/**
  * @}
  */

/** @addtogroup UI_String_Exported_Functions
  * @{
  */
void UI_SetStringType(uint8_t strTypeIdx);
const char * UI_GetString(uint8_t strIdx);

/**
  * @}
  */


#ifdef __cplusplus
}
#endif

#endif /* __UI_STRING_H */

/**
  * @}
  */

/**
  * @}
  */

/**********************************END OF FILE*********************************/
