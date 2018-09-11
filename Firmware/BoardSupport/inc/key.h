/**
  ******************************************************************************
  * @file    key.h
  * @author  Vipul Panchal
  * @brief   This file contains definitions for keypad resources.
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __KEY_H
#define __KEY_H

#ifdef __cplusplus
extern "C" {
#endif

/* Key Press Status */
#define KEY_RELEASED                   (0)
#define KEY_PRESSED                    (1)

/* Key Status Definition */
#define KEY_STATE_IDLE                 (0)
#define KEY_STATE_PRESSED              (1)
#define KEY_STATE_RELEASED             (2)

/* Keypad Key List */
typedef enum
{
  KPD_KEY_DIG0,
  KPD_KEY_DIG1,
  KPD_KEY_DIG2,
  KPD_KEY_DIG3,
  KPD_KEY_DIG4,
  KPD_KEY_DIG5,
  KPD_KEY_DIG6,
  KPD_KEY_DIG7,
  KPD_KEY_DIG8,
  KPD_KEY_DIG9,
  KPD_KEY_ADD,
  KPD_KEY_ADD_UV,
  KPD_KEY_VALM,
  KPD_KEY_UV,
  KPD_KEY_AUTO,
  KPD_KEY_MANUAL,
  KPD_KEY_MODE,
  KPD_KEY_FUNC,
  KPD_KEY_UP,
  KPD_KEY_DOWN,
  KPD_KEY_BACK,
  KPD_KEY_NEXT,
  KPD_KEY_ENT,
  KPD_KEY_CLR,
  KPD_KEY_V10,
  KPD_KEY_V20,
  KPD_KEY_V50,
  KPD_KEY_V100,
  KPD_KEY_V500,
  KPD_KEY_V1000,
  KPD_KEY_TENS,
  KPD_KEY_UNITS,
  KPD_KEY_MAX
} KPD_KEY_LIST_T;  

typedef enum 
{
  KPD_TYPE_6_6X1,
  KPD_TYPE_7_7X1,
  KPD_TYPE_17_9X2,
  KPD_TYPE_18_3X7,
  KPD_TYPE_26_7X4_NOVAL,
  KPD_TYPE_26_7X4_VAL,
  KPD_TYPE_15_4X4,
  KPD_TYPE_MAX_NB
}KPD_TYPE_NB_T;

typedef struct
{
  uint8_t  state;
  uint8_t  press;
  uint8_t  debounce;
  uint32_t backuptime;
}KEY_INFO_T;

typedef struct 
{
  const uint8_t main;
  const uint8_t alt;
  
}KEY_VAL_MAP_T;

typedef void ( *F_KPD_INIT )( void );
typedef void ( *F_KPD_SCAN )( KEY_VAL_MAP_T *,KEY_INFO_T * );

typedef struct
{
  const uint8_t   nbScanLine;
  const uint8_t   nbReturnLine;
  const uint8_t   nbKeys;
  KEY_VAL_MAP_T   *pKeyValueMap;
  F_KPD_INIT      kpdInit;
  F_KPD_SCAN      kpdScan;
} KPD_TYPE_T;



void KPD_Init(uint8_t index, uint8_t debounce, void (* cb)(uint8_t, uint8_t));
void KPD_SetState(uint8_t key, uint8_t pressState);
void KPD_Scan(void);
uint8_t KPD_IsPressed(uint8_t keyNo);
void KPD_SetDebounceTime(uint8_t debounce);
uint8_t KPD_GetDebounceTime(void);
void KPD_AddEventListener(void (* cb)(uint8_t, uint8_t));

#ifdef __cplusplus
}
#endif

#endif /* __KEY_H */

/******************************END OF FILE*****/
