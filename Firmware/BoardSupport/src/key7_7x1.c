/**
  ******************************************************************************
  * @file    key_18_3x7.c
  * @author  Vipul Panchal
  * @version V1.0.0
  * @date    31-July-2017
  * @brief   Contains the functions to handle matrix keypad scanning,
  *          read/write keypad status specific to 18 keys 3x7 keypad
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
/* GPIO for Keypad mapping against connector pins */
#define KPD_MUXA_GPIO_PORT (CONN_PIN12_GPIO_PORT)
#define KPD_MUXA_GPIO_PIN  (CONN_PIN12_GPIO_PIN)

#define KPD_MUXB_GPIO_PORT (CONN_PIN13_GPIO_PORT)
#define KPD_MUXB_GPIO_PIN  (CONN_PIN13_GPIO_PIN)

#define KPD_MUXC_GPIO_PORT (CONN_PIN14_GPIO_PORT)
#define KPD_MUXC_GPIO_PIN  (CONN_PIN14_GPIO_PIN)

#define KPD_RET0_PORT      (CONN_PIN24_GPIO_PORT)
#define KPD_RET0_PIN       (CONN_PIN24_GPIO_PIN)

/* Keypad Matrix Definitions */
#define MAX_SC_LINES   (7)

#define NB_SC_4_RT0    (7)

#define SC_NB_MUXED    (7)

#define MAX_RT_LINES   (1)

#define NB_RT_4_SC0    (1)
#define NB_RT_4_SC1    (1)
#define NB_RT_4_SC2    (1)
#define NB_RT_4_SC3    (1)
#define NB_RT_4_SC4    (1)
#define NB_RT_4_SC5    (1)
#define NB_RT_4_SC6    (1)

#define RT_NB_MUXED    (1)

#define NB_KEYS  \
  (NB_SC_4_RT0)

/* Private function prototypes -----------------------------------------------*/
static void KpdInit(void);
static void KpdScan(uint8_t * pKeyValueMap, KEY_INFO_T * pKeyInfo);

/* Private constants----------------------------------------------------------*/
/* List of Keypad Scan Lines GPIO Port Pins */
static const uint8_t NB_SC_4_RT[MAX_RT_LINES] =
{
  NB_SC_4_RT0
};

static const uint8_t NB_SC_4_RT_ACC[MAX_RT_LINES] =
{
  0
};

static const uint8_t NB_RT_4_SC[MAX_SC_LINES] =
{
  NB_RT_4_SC0,
  NB_RT_4_SC1,
  NB_RT_4_SC2,
  NB_RT_4_SC3,
  NB_RT_4_SC4,
  NB_RT_4_SC5,
  NB_RT_4_SC6
};

static const uint8_t NB_RT_4_SC_ACC[MAX_SC_LINES] =
{
  0,
  NB_RT_4_SC0,
  NB_RT_4_SC0 + NB_RT_4_SC1,
  NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2,
  NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2 + NB_RT_4_SC3,
  NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2 + NB_RT_4_SC3 + NB_RT_4_SC4,
  NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2 + NB_RT_4_SC3 + NB_RT_4_SC4 + NB_RT_4_SC5,
};

/* Matrix Key code Mapping to BSP Key Value */
static const uint8_t KEY_VALUE_MAP[NB_KEYS] = 
{
  KPD_KEY_MODE,
  KPD_KEY_ADD,
  KPD_KEY_AUTO,
  KPD_KEY_UP,
  KPD_KEY_DOWN,
  KPD_KEY_CLR,
  KPD_KEY_ENT
};

/* Public constants ----------------------------------------------------------*/
/* Keypad Type table */
const KPD_TYPE_T KeypadType_7_7x1 = 
{
  .nbScanLine = MAX_SC_LINES,
  .nbReturnLine = MAX_RT_LINES,
  .nbKeys = NB_KEYS,
  .pKeyValueMap = KEY_VALUE_MAP,
  .kpdInit = KpdInit,
  .kpdScan = KpdScan
};

/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Configure Scan Lines for I/O Function
  *         Enable the GPIO Clock, Initialize GPIO as Output for
  *         each Scan Line
  * @param  None
  * @retval None
  */
@inline static void ConfigScanLinesIO(void)
{
  /* Configure Keypad scan pins as Output
     Default State is High 
  */
  GPIO_Init(KPD_MUXA_GPIO_PORT, KPD_MUXA_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(KPD_MUXB_GPIO_PORT, KPD_MUXB_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(KPD_MUXC_GPIO_PORT, KPD_MUXC_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
}
/**
  * @brief  Configure Return Lines for I/O Function
  *         Enable the GPIO Clock, Initialize GPIO as Input for
  *         each Return Line
  * @param  None
  * @retval None
  */
@inline static void ConfigReturnLinesIO(void)
{
  /* Configure Keypad return pins as Input
     return lines are left floating, external pulldown present on pins
  */
  GPIO_Init(KPD_RET0_PORT, KPD_RET0_PIN, GPIO_MODE_IN_FL_NO_IT);
}

/**
  * @brief  Set all Scan Line to Logic Level High
  * @param  None
  * @retval None
  */
@inline void SetAllScanLines(void) 
{
  KPD_MUXA_GPIO_PORT->ODR &= ~KPD_MUXA_GPIO_PIN;
  KPD_MUXB_GPIO_PORT->ODR &= ~KPD_MUXB_GPIO_PIN;
  KPD_MUXC_GPIO_PORT->ODR &= ~KPD_MUXC_GPIO_PIN;
}

/**
  * @brief  Clear a Scan Line to Logic Level Low
  * @param  nb - ranges form 0 to NB_SC_4_RT_DEF - 1
  * @retval None
  */
@inline static void ClrScanLine(uint8_t nb)
{
  if(nb < SC_NB_MUXED) 
  {
		nb += 1;
    ((nb) & 0x01) ? (KPD_MUXA_GPIO_PORT->ODR |= KPD_MUXA_GPIO_PIN) : (KPD_MUXA_GPIO_PORT->ODR &= ~KPD_MUXA_GPIO_PIN);
    ((nb) & 0x02) ? (KPD_MUXB_GPIO_PORT->ODR |= KPD_MUXB_GPIO_PIN) : (KPD_MUXB_GPIO_PORT->ODR &= ~KPD_MUXB_GPIO_PIN);
    ((nb) & 0x04) ? (KPD_MUXC_GPIO_PORT->ODR |= KPD_MUXC_GPIO_PIN) : (KPD_MUXC_GPIO_PORT->ODR &= ~KPD_MUXC_GPIO_PIN);
  }
}

/**
  * @brief  Get the Logic Level on a Return Line
  * @param  None
  * @retval returns Mux Value
  */
@inline static uint8_t GetReturnVal(void)
{
  uint8_t val = 0;
  val |= (uint8_t)((KPD_RET0_PORT->IDR & KPD_RET0_PIN) ? 1<<0: 0);

  return val;
}

/**
  * @brief  Initialize the Keypad
  *         Initialize Row & Column Lines of the Matrix
  * @param  None
  * @retval None
  */
static void KpdInit(void)
{
  ConfigScanLinesIO();
  ConfigReturnLinesIO();
}

/**
  * @brief  Scan the Keypad
  *         scans each key sequentially and updates the key status
  * @note   Must be called in a continious loop
  * @param  None
  * @retval None
  */
static void KpdScan(uint8_t * pKeyValueMap, KEY_INFO_T * pKeyInfo)
{
  uint8_t keyNo = 0, scanLine = 0, retLine = 0;
  uint8_t keyPressBit[(NB_KEYS / 8) + ((NB_KEYS % 8) ? (1) : (0)) ] = {0};
  uint32_t bspSysTime = BSP_GetSysTime();

  /* Check if any key is pressed in Muxed lines */
  SetAllScanLines();
  retLine = GetReturnVal();

  if(retLine > 0)
  {
    for(scanLine = 0; scanLine < NB_SC_4_RT[retLine - 1]; scanLine++)  
    {
      uint8_t retVal = 0;
      
      ClrScanLine(scanLine);
      retVal = GetReturnVal();
      
      if((retVal == 0) || (scanLine == SC_NB_MUXED))
      {
        keyNo = (uint8_t)(NB_SC_4_RT_ACC[retLine - 1] + scanLine);
        /* change the key press state */
        keyPressBit[keyNo >> 3] |= (uint8_t)(1 << (keyNo & 0x7));
        break;
      }
    }
  }
  
  SetAllScanLines();

  /* Set Key State */  
  for(keyNo = 0; keyNo < NB_KEYS; keyNo++)
  {
    uint8_t  keyScanNo, keyPressState;

    keyPressState = (uint8_t)((keyPressBit[keyNo >> 3] & (1 << (keyNo & 0x7))) ? CLOSED : OPEN);
    
    /* Map the Key No to Key Value Index */
    keyScanNo = pKeyValueMap[(uint8_t)keyNo];
    
    if(keyScanNo != 0xFF)
    {
      /* Check if the key state is changed */
      if(keyPressState != pKeyInfo[keyScanNo].press)
      {
        /* Check if the debounce verification is done */
        if(pKeyInfo[keyScanNo].debounce == TRUE)
        {
          int32_t debounce = (int32_t)KPD_GetDebounceTime();
          /* wait for debounce verification */
          if(absolute((int32_t)(bspSysTime - pKeyInfo[keyScanNo].backuptime)) >= debounce)
          {
            /* change the key press state */
            pKeyInfo[keyScanNo].press = (uint8_t)(
              pKeyInfo[keyScanNo].press == OPEN ? CLOSED : OPEN);
            pKeyInfo[keyScanNo].debounce = FALSE;
          }
        }
        else
        {
          /* Pre debounce check
             Mark the bsp timer for debounce check,
             set the debounce check start flag as true
           */
          pKeyInfo[keyScanNo].backuptime = bspSysTime;
          pKeyInfo[keyScanNo].debounce = TRUE;
        }
      }
      else
      {
        pKeyInfo[keyScanNo].debounce = FALSE;
      }
  
      KPD_SetState(keyScanNo, pKeyInfo[keyScanNo].press);
    }
  }
}

/***********************END OF FILE************************/
