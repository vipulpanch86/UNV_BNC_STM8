/**
  ******************************************************************************
  * @file    key.c
  * @author  Vipul Panchal
  * @brief   Contains the functions to handle different matrix keypads,
  *          Initialization and Status update
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bsp.h"

/* External Declaration-------------------------------------------------------*/
extern KPD_TYPE_T KeypadType_6_6x1;
extern KPD_TYPE_T KeypadType_7_7x1;
extern KPD_TYPE_T KeypadType_17_9x2;
extern KPD_TYPE_T KeypadType_18_3x7;
extern KPD_TYPE_T KeypadType_26_7x4_NoVal;
extern KPD_TYPE_T KeypadType_26_7x4_Val;

/* Private constants----------------------------------------------------------*/
/* Keypad info table */
static const KPD_TYPE_T * KeypadType[KPD_TYPE_MAX_NB] = 
{
	&KeypadType_6_6x1,
	&KeypadType_7_7x1,
  &KeypadType_17_9x2,
  &KeypadType_18_3x7,
  &KeypadType_26_7x4_NoVal,
  &KeypadType_26_7x4_Val,
};

/* Private variables ---------------------------------------------------------*/
static  KEY_INFO_T KeyInfo[KPD_KEY_MAX];
static const KPD_TYPE_T * pKeypad = NULL;
//static  uint8_t    KeyScanNo      = 0;
static  uint8_t    DebounceTime   = 0;
//static  uint32_t   KeyScanTimer   = 0;
static  void (* KeypadCB)(uint8_t, uint8_t);

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Initialize the Keypad
  *         Initialize Row & Column Lines of the Matrix,
  *         Set key debounce value,
  *         Set key hold time,
  *         Install call back function.
  * @param  index - keypad to select from a list of various keypad's
  * @param  debounce - key debounce value in milliseconds
  * @param  cb - callback function when a key state changes
  * @retval None
  */
void KPD_Init(uint8_t index, uint8_t debounce, void (* cb)(uint8_t, uint8_t))
{
  uint8_t key;

  if(index < KPD_TYPE_MAX_NB)
  {
    pKeypad = KeypadType[index];
    pKeypad->kpdInit();
  }

  DebounceTime = (debounce < 1) ? (1) : (debounce);
  KeypadCB = cb;
  
//  KeyScanTimer = 0;
//  KeyScanNo = 0;

  for(key = 0; key < KPD_KEY_MAX; key++)
  {
    KeyInfo[key].state = KEY_STATE_IDLE;
    KeyInfo[key].press = OPEN;
    KeyInfo[key].debounce = FALSE;
    KeyInfo[key].backuptime = 0;
  }
}

/**
  * @brief  Set the current state of the key
  *         Change the current key status depending on the previous
  *         state of the key
  * @param  key - ranges form 0 to KPD_KEY_MAX - 1
  * @param  pressState - the key press state OPEN / CLOSED
  * @retval None
  */
void KPD_SetState(uint8_t key, uint8_t pressState)
{
  if(key < KPD_KEY_MAX)
  {
    /* Waiting for a keypress */
    if(KeyInfo[key].state == KEY_STATE_IDLE)
    {
      if(pressState == CLOSED)
      {
        /* Update the state to pressed */
        KeyInfo[key].state = KEY_STATE_PRESSED;

        /* Generate a callback */
        if(KeypadCB != NULL)
        {
          KeypadCB(key, KeyInfo[key].state);
        }
      }
    }
    else if(KeyInfo[key].state == KEY_STATE_PRESSED)
    {
      if(pressState == OPEN)
      {
        KeyInfo[key].state = KEY_STATE_RELEASED;

        /* Generate a callback */
        if(KeypadCB != NULL)
        {
          KeypadCB(key, KeyInfo[key].state);
        }
      }
    }
    else
    {
      KeyInfo[key].state = KEY_STATE_IDLE;
    }
  }
}

/**
  * @brief  Scan the Keypad
  *         scans each key sequentially and updates the key status
  * @note   Must be called in a continious loop
  * @param  None
  * @retval None
  */
void KPD_Scan(void)
{
  if(pKeypad != NULL)
  {
    pKeypad->kpdScan(pKeypad->pKeyValueMap, &KeyInfo[0]);
  }
}

/**
  * @brief  Checks if a key is pressed
  *         Checks the key buffer status for KEY_STATE_PRESSED & KEY_STATE_HOLD
  * @param  key - The Key whose status needs to be checked
  * @retval TRUE if key is pressed, FALSE if key is released
  */
uint8_t KPD_IsPressed(uint8_t key)
{

  if(KeyInfo[key].state == KEY_STATE_PRESSED)
  {
    return KPD_KEY_PRESSED;
  }
  else
  {
    return KPD_KEY_RELEASED;
  }
}

/**
  * @brief  Sets the key debounce time
  *         Sets the key debounce time in milliseconds
  * @param  debounce - key debounce value in milliseconds
  * @retval None
  */
void KPD_SetDebounceTime(uint8_t debounce)
{
  DebounceTime = (debounce < 1) ? (1) : (debounce);
}

/**
  * @brief  Gets the key debounce time in milliseconds
  * @param  None
  * @retval Returns set debounce time in milliseconds
  */
uint8_t KPD_GetDebounceTime(void)
{
  return DebounceTime;
}

/**
  * @brief  Installs a callback for a keypad event change
  * @param  cb - pointer to the callback function
  * @retval None
  */
void KPD_AddEventListener(void (* cb)(uint8_t, uint8_t))
{
  KeypadCB = cb;
}
/***********************END OF FILE************************/
