/**
  ******************************************************************************
  * @file    key_15_4x4.c
  * @author  Vipul Panchal
  * @brief   Contains the functions to handle matrix keypad scanning,
  *          read/write keypad status specific to 15 keys 4x4 keypad
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

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

#define KPD_SCA3_GPIO_CLK  (CONN_PIN22_GPIO_CLK)
#define KPD_SCA3_GPIO_PORT (CONN_PIN22_GPIO_PORT)
#define KPD_SCA3_GPIO_PIN  (CONN_PIN22_GPIO_PIN)

#define KPD_RET0_GPIO_CLK  (CONN_PIN24_GPIO_CLK)
#define KPD_RET0_GPIO_PORT (CONN_PIN24_GPIO_PORT)
#define KPD_RET0_GPIO_PIN  (CONN_PIN24_GPIO_PIN)

#define KPD_RET1_GPIO_CLK  (CONN_PIN29_GPIO_CLK)
#define KPD_RET1_GPIO_PORT (CONN_PIN29_GPIO_PORT)
#define KPD_RET1_GPIO_PIN  (CONN_PIN29_GPIO_PIN)

/*
#define KPD_RET0_GPIO_CLK  (CONN_PIN23_GPIO_CLK)
#define KPD_RET0_GPIO_PORT (CONN_PIN23_GPIO_PORT)
#define KPD_RET0_GPIO_PIN  (CONN_PIN23_GPIO_PIN)

#define KPD_RET1_GPIO_CLK  (CONN_PIN24_GPIO_CLK)
#define KPD_RET1_GPIO_PORT (CONN_PIN24_GPIO_PORT)
#define KPD_RET1_GPIO_PIN  (CONN_PIN24_GPIO_PIN)
*/

#define KPD_RET2_GPIO_CLK  (CONN_PIN28_GPIO_CLK)
#define KPD_RET2_GPIO_PORT (CONN_PIN28_GPIO_PORT)
#define KPD_RET2_GPIO_PIN  (CONN_PIN28_GPIO_PIN)

#define KPD_RET3_GPIO_CLK  (CONN_PIN27_GPIO_CLK)
#define KPD_RET3_GPIO_PORT (CONN_PIN27_GPIO_PORT)
#define KPD_RET3_GPIO_PIN  (CONN_PIN27_GPIO_PIN)

/* Keypad Matrix Definitions */
#define MAX_SC_LINES   (4)

#define NB_SC_4_RT0    (4)
#define NB_SC_4_RT1    (4)
#define NB_SC_4_RT2    (4) // TODO - check if it needs to be 3
#define NB_SC_4_RT3    (4)

#define SC_NB_MUXED    (0)

#define MAX_RT_LINES   (4)

#define NB_RT_4_SC0    (4)
#define NB_RT_4_SC1    (4)
#define NB_RT_4_SC2    (4) // TODO - check if it needs to be 3
#define NB_RT_4_SC3    (4)

#define RT_NB_MUXED    (0)

#define NB_KEYS  \
  (NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2 + NB_RT_4_SC3)

/* Private function prototypes -----------------------------------------------*/
static void KpdInit(void);
static void KpdScan(KEY_VAL_MAP_T * pKeyValueMap, KEY_INFO_T * pKeyInfo);

/* Private constants----------------------------------------------------------*/
/* List of Keypad Scan Lines GPIO Port Pins */
static const GPIO_TypeDef *SCAN_GPIO_PORT[MAX_SC_LINES - SC_NB_MUXED] =
{
  KPD_SCA0_GPIO_PORT,
  KPD_SCA1_GPIO_PORT,
  KPD_SCA2_GPIO_PORT,
  KPD_SCA3_GPIO_PORT
};

/* List of Keypad Scan Lines GPIO Port Pins */
static const uint8_t SCAN_GPIO_PIN[MAX_SC_LINES - SC_NB_MUXED] =
{
  KPD_SCA0_GPIO_PIN,
  KPD_SCA1_GPIO_PIN,
  KPD_SCA2_GPIO_PIN,
  KPD_SCA3_GPIO_PIN
};

/* List of Keypad Return Lines GPIO Port Pins */
static const GPIO_TypeDef *RET_GPIO_PORT[MAX_RT_LINES - RT_NB_MUXED] =
{
  KPD_RET0_GPIO_PORT,
  KPD_RET1_GPIO_PORT,
  KPD_RET2_GPIO_PORT,
  KPD_RET3_GPIO_PORT
};

/* List of Keypad Return Lines GPIO Port Pins */
static const uint8_t RET_GPIO_PIN[MAX_RT_LINES - RT_NB_MUXED] =
{
  KPD_RET0_GPIO_PIN,
  KPD_RET1_GPIO_PIN,
  KPD_RET2_GPIO_PIN,
  KPD_RET3_GPIO_PIN
};

static const uint8_t NB_SC_4_RT[MAX_RT_LINES] =
{
  NB_SC_4_RT0,
  NB_SC_4_RT1,
  NB_SC_4_RT2,
  NB_SC_4_RT3
};

static const uint8_t NB_SC_4_RT_ACC[MAX_RT_LINES] =
{
  0,
  NB_SC_4_RT0,
  NB_SC_4_RT0 + NB_SC_4_RT1,
  NB_SC_4_RT0 + NB_SC_4_RT1 + NB_SC_4_RT2
};

static const uint8_t NB_RT_4_SC[MAX_SC_LINES] =
{
  NB_RT_4_SC0,
  NB_RT_4_SC1,
  NB_RT_4_SC2,
  NB_RT_4_SC3
};

static const uint8_t NB_RT_4_SC_ACC[MAX_SC_LINES] =
{
  0,
  NB_RT_4_SC0,
  NB_RT_4_SC0 + NB_RT_4_SC1,
  NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2
};

/* Matrix Key code Mapping to BSP Key Value */
static const KEY_VAL_MAP_T KEY_VALUE_MAP[NB_KEYS] = 
{
  { KPD_KEY_CLR, 0xFF},
  { KPD_KEY_DIG0, 0xFF},
  { KPD_KEY_MODE, 0xFF},
  { KPD_KEY_ADD, 0xFF},
  { KPD_KEY_DIG3, KPD_KEY_UP},
  { KPD_KEY_DIG2, 0xFF},
  { KPD_KEY_ENT, 0xFF},
  { KPD_KEY_DIG1, KPD_KEY_NEXT},
  { KPD_KEY_DIG6, 0xFF},
  { KPD_KEY_DIG5, 0xFF},
  { 0xFF, 0xFF},
  { KPD_KEY_DIG4, 0xFF},
  { KPD_KEY_DIG9, KPD_KEY_DOWN},
  { KPD_KEY_DIG8, 0xFF},
  { KPD_KEY_AUTO, 0xFF},
  { KPD_KEY_DIG7, KPD_KEY_BACK},
};

/* Public constants ----------------------------------------------------------*/
/* Keypad Type table */
const KPD_TYPE_T KeypadType_15_4x4 = 
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
  GPIO_Init(KPD_SCA3_GPIO_PORT, KPD_SCA3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
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
     return lines are pulled up, no external pullup present on pins
  */
  GPIO_Init(KPD_RET0_GPIO_PORT, KPD_RET0_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(KPD_RET1_GPIO_PORT, KPD_RET1_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(KPD_RET2_GPIO_PORT, KPD_RET2_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(KPD_RET3_GPIO_PORT, KPD_RET3_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

/**
  * @brief  Set a Scan Line to Logic Level High
  * @param  nb - ranges form 0 to NB_SC_4_RT_DEF - 1
  * @retval None
  */
@inline static void SetScanLine(uint8_t nb)
{
  BSP_SetGPIO(SCAN_GPIO_PORT[nb], SCAN_GPIO_PIN[nb]);
}

/**
  * @brief  Clear a Scan Line to Logic Level Low
  * @param  nb - ranges form 0 to NB_SC_4_RT_DEF - 1
  * @retval None
  */
@inline static void ClrScanLine(uint8_t nb)
{
  BSP_ClrGPIO(SCAN_GPIO_PORT[nb], SCAN_GPIO_PIN[nb]);
}

/**
  * @brief  Get the Logic Level on a Return Line
  * @param  nb - ranges form 0 to MAX_RT_LINES - 1
  * @retval returns HIGH / LOW status of the Logic Level on Return Line
  */
@inline static uint8_t GetRetLine(uint8_t nb)
{
  uint8_t val = (uint8_t)((RET_GPIO_PORT[nb]->IDR & RET_GPIO_PIN[nb]) ? HIGH : LOW);
  
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
static void KpdScan(KEY_VAL_MAP_T * pKeyValueMap, KEY_INFO_T * pKeyInfo)
{
  static uint8_t KeyScanLineNb = 0;
  volatile uint32_t bspSysTime = BSP_GetSysTime();
  uint8_t  keyRetLineNb = 0;

  ClrScanLine(KeyScanLineNb);

  for(; keyRetLineNb < NB_RT_4_SC[KeyScanLineNb]; keyRetLineNb++)
  {
    uint8_t  keyScanNo, keyAltNo, keyPressState;

    keyPressState = (uint8_t)((GetRetLine(keyRetLineNb) == LOW) ? CLOSED : OPEN);
    
    /* Map the Key code generated from scan & return lines to
       Key Value Index */
    keyScanNo = pKeyValueMap[(uint8_t)(NB_RT_4_SC_ACC[KeyScanLineNb] + keyRetLineNb)].main;
    keyAltNo = pKeyValueMap[(uint8_t)(NB_RT_4_SC_ACC[KeyScanLineNb] + keyRetLineNb)].alt;
    
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
          if(labs((int32_t)(bspSysTime - pKeyInfo[keyScanNo].backuptime)) >= debounce)
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
      KPD_SetState(keyAltNo, pKeyInfo[keyScanNo].press);
    }
  }

  SetScanLine(KeyScanLineNb);

  KeyScanLineNb++;
  KeyScanLineNb %= MAX_SC_LINES;
  
  ClrScanLine(KeyScanLineNb);
}

/***********************END OF FILE************************/
