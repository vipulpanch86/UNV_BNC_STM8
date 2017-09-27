/**
  ******************************************************************************
  * @file    key_18_3x7.c
  * @author  Vipul Panchal
  * @version V1.0.0
  * @date    31-July-2017
  * @brief   Contains the functions to handle matrix keypad scanning,
  *          read/write keypad status
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bsp.h"

/* Pending - KeyNo should have a mapping with unique key code to keep the ui_key.c same */
/* Private define ------------------------------------------------------------*/
/* GPIO for Keypad mapping against connector pins */
#define KPD_SCA0_GPIO_CLK  (CONN_PIN19_GPIO_CLK)
#define KPD_SCA0_GPIO_PORT (CONN_PIN19_GPIO_PORT)
#define KPD_SCA0_GPIO_PIN  (CONN_PIN19_GPIO_PIN)

#define KPD_SCA1_GPIO_CLK  (CONN_PIN20_GPIO_CLK)
#define KPD_SCA1_GPIO_PORT (CONN_PIN20_GPIO_PORT)
#define KPD_SCA1_GPIO_PIN  (CONN_PIN20_GPIO_PIN)

#define KPD_SCA2_GPIO_CLK  (CONN_PIN21_GPIO_CLK)
#define KPD_SCA2_GPIO_PORT (CONN_PIN21_GPIO_PORT)
#define KPD_SCA2_GPIO_PIN  (CONN_PIN21_GPIO_PIN)

#define KPD_MUXC_GPIO_CLK  (CONN_PIN13_GPIO_CLK)
#define KPD_MUXC_GPIO_PORT (CONN_PIN13_GPIO_PORT)
#define KPD_MUXC_GPIO_PIN  (CONN_PIN13_GPIO_PIN)

#define KPD_MUXB_GPIO_CLK  (CONN_PIN12_GPIO_CLK)
#define KPD_MUXB_GPIO_PORT (CONN_PIN12_GPIO_PORT)
#define KPD_MUXB_GPIO_PIN  (CONN_PIN12_GPIO_PIN)

#define KPD_MUXA_GPIO_CLK  (CONN_PIN11_GPIO_CLK)
#define KPD_MUXA_GPIO_PORT (CONN_PIN11_GPIO_PORT)
#define KPD_MUXA_GPIO_PIN  (CONN_PIN11_GPIO_PIN)

/* Keypad Matrix Definitions */
#define MAX_SC_LINES   (3)

#define NB_SC_4_RT0    (3)
#define NB_SC_4_RT1    (3)
#define NB_SC_4_RT2    (3)
#define NB_SC_4_RT3    (3)
#define NB_SC_4_RT4    (2)
#define NB_SC_4_RT5    (2)
#define NB_SC_4_RT6    (2)

#define SC_NB_MUXED    (0)

#define MAX_RT_LINES   (7)

#define NB_RT_4_SC0    (7)
#define NB_RT_4_SC1    (7)
#define NB_RT_4_SC2    (4)

#define RT_NB_MUXED    (7)

#define NB_KEYS  \
  (NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2)

/* Private function prototypes -----------------------------------------------*/
static void KpdInit(void);
static void KpdScan(KEY_INFO_T * pKeyInfo);

/* Private constants----------------------------------------------------------*/
/* List of Keypad Scan Lines GPIO Port Pins */
static const GPIO_TypeDef *SCAN_GPIO_PORT[MAX_SC_LINES - SC_NB_MUXED] =
{
  KPD_SCA0_GPIO_PORT,
  KPD_SCA1_GPIO_PORT,
  KPD_SCA2_GPIO_PORT
};

/* List of Keypad Scan Lines GPIO Port Pins */
static const uint16_t SCAN_GPIO_PIN[MAX_SC_LINES - SC_NB_MUXED] =
{
  KPD_SCA0_GPIO_PIN,
  KPD_SCA1_GPIO_PIN,
  KPD_SCA2_GPIO_PIN
};

static const uint8_t NB_SC_4_RT[MAX_RT_LINES] =
{
  NB_SC_4_RT0,
  NB_SC_4_RT1,
  NB_SC_4_RT2,
  NB_SC_4_RT3,
  NB_SC_4_RT4,
  NB_SC_4_RT5,
  NB_SC_4_RT6
};

static const uint8_t NB_SC_4_RT_ACC[MAX_RT_LINES] =
{
  0,
  NB_SC_4_RT0,
  NB_SC_4_RT0 + NB_SC_4_RT1,
  NB_SC_4_RT0 + NB_SC_4_RT1 + NB_SC_4_RT2,
  NB_SC_4_RT0 + NB_SC_4_RT1 + NB_SC_4_RT2 + NB_SC_4_RT3,
  NB_SC_4_RT0 + NB_SC_4_RT1 + NB_SC_4_RT2 + NB_SC_4_RT3 + NB_SC_4_RT4,
  NB_SC_4_RT0 + NB_SC_4_RT1 + NB_SC_4_RT2 + NB_SC_4_RT3 + NB_SC_4_RT4 + NB_SC_4_RT5
};

static const uint8_t NB_RT_4_SC[MAX_SC_LINES] =
{
  NB_RT_4_SC0,
  NB_RT_4_SC1,
  NB_RT_4_SC2
};

static const uint8_t NB_RT_4_SC_ACC[MAX_SC_LINES] =
{
  0,
  NB_RT_4_SC0,
  NB_RT_4_SC0 + NB_RT_4_SC1
};

/* Matrix Key code Mapping to BSP Key Value */
static const uint8_t KEY_VALUE_MAP[NB_KEYS] = 
{
  KPD_KEY_DIG1,
  KPD_KEY_DIG2,
  KPD_KEY_DIG3,
  KPD_KEY_DIG4,
  KPD_KEY_DIG5,
  KPD_KEY_DIG6,
  KPD_KEY_DIG7,
  KPD_KEY_DIG8,
  KPD_KEY_DIG9,
  KPD_KEY_DIG0,
  KPD_KEY_ADD,
  KPD_KEY_UV,
  KPD_KEY_AUTO,
  KPD_KEY_UP,
  KPD_KEY_ENT,
  KPD_KEY_DOWN,
  KPD_KEY_CLR,
  KPD_KEY_MODE
};

/* Public constants ----------------------------------------------------------*/
/* Keypad Type table */
const KPD_TYPE_T KeypadType_18_3x7 = 
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
  GPIO_Init(KPD_SCA0_GPIO_PORT, KPD_SCA0_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(KPD_SCA1_GPIO_PORT, KPD_SCA1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(KPD_SCA2_GPIO_PORT, KPD_SCA2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
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
     return lines are pulled up
  */
  GPIO_Init(KPD_MUXA_GPIO_PORT, KPD_MUXA_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(KPD_MUXB_GPIO_PORT, KPD_MUXB_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(KPD_MUXC_GPIO_PORT, KPD_MUXC_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

/**
  * @brief  Set a Scan Line to Logic Level High
  * @param  nb - ranges form 0 to NB_SC_4_RT_DEF - 1
  * @retval None
  */
@inline static void SetScanLine(uint8_t nb)
{
  ((GPIO_TypeDef *)(SCAN_GPIO_PORT[nb]))->ODR |= SCAN_GPIO_PIN[nb];
}

/**
  * @brief  Clear a Scan Line to Logic Level Low
  * @param  nb - ranges form 0 to NB_SC_4_RT_DEF - 1
  * @retval None
  */
@inline static void ClrScanLine(uint8_t nb)
{
  ((GPIO_TypeDef *)(SCAN_GPIO_PORT[nb]))->ODR &= ~SCAN_GPIO_PIN[nb];
}

/**
  * @brief  Get the Logic Level on a Return Line
  * @param  nb - ranges form 0 to MAX_RT_LINES - 1
  * @retval returns HIGH / LOW status of the Logic Level on Return Line
  */
@inline static uint8_t GetRetLine(uint8_t nb)
{
  uint8_t val;
  int8_t logicVal = 0;
  
  logicVal |= (int8_t)((KPD_MUXA_GPIO_PORT->IDR & KPD_MUXA_GPIO_PIN) ? 0: 1<<0);
  logicVal |= (int8_t)((KPD_MUXB_GPIO_PORT->IDR & KPD_MUXB_GPIO_PIN) ? 0: 1<<1);
  logicVal |= (int8_t)((KPD_MUXC_GPIO_PORT->IDR & KPD_MUXC_GPIO_PIN) ? 0: 1<<2);
  val = (uint8_t)((logicVal - 1) == nb ? LOW : HIGH);
  
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
static void KpdScan(KEY_INFO_T * pKeyInfo)
{
  static uint8_t KeyScanLineNb = 0;
  volatile uint32_t bspSysTime = BSP_GetSysTime();
  uint8_t  keyRetLineNb = 0;

  ClrScanLine(KeyScanLineNb);

  for(; keyRetLineNb < NB_RT_4_SC[KeyScanLineNb]; keyRetLineNb++)
  {
    uint8_t  keyScanNo, keyPressState;

    keyPressState = ((GetRetLine(keyRetLineNb) == LOW) ? CLOSED : OPEN);
    
    /* Map the Key code generated from scan & return lines to
       Key Value Index */
    keyScanNo = KEY_VALUE_MAP[(uint8_t)(NB_RT_4_SC_ACC[KeyScanLineNb] + keyRetLineNb)];
    
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

  SetScanLine(KeyScanLineNb);

  KeyScanLineNb++;
  KeyScanLineNb %= MAX_SC_LINES;
  
  ClrScanLine(KeyScanLineNb);
}

/***********************END OF FILE************************/
