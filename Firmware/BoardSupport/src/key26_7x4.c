/**
  ******************************************************************************
  * @file    key_26_7x4.c
  * @author  Vipul Panchal
  * @brief   Contains the functions to handle matrix keypad scanning,
  *          read/write keypad status specific to 26 keys 7x4 keypad
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
/* GPIO for Keypad mapping against connector pins */
#define SCA_DEMC_GPIO_CLK  (CONN_PIN14_GPIO_CLK)
#define SCA_DEMC_GPIO_PORT (CONN_PIN14_GPIO_PORT)
#define SCA_DEMC_GPIO_PIN  (CONN_PIN14_GPIO_PIN)

#define SCA_DEMB_GPIO_CLK  (CONN_PIN13_GPIO_CLK)
#define SCA_DEMB_GPIO_PORT (CONN_PIN13_GPIO_PORT)
#define SCA_DEMB_GPIO_PIN  (CONN_PIN13_GPIO_PIN)

#define SCA_DEMA_GPIO_CLK  (CONN_PIN12_GPIO_CLK)
#define SCA_DEMA_GPIO_PORT (CONN_PIN12_GPIO_PORT)
#define SCA_DEMA_GPIO_PIN  (CONN_PIN12_GPIO_PIN)

#define RET_MUXC_GPIO_CLK  (CONN_PIN16_GPIO_CLK)
#define RET_MUXC_GPIO_PORT (CONN_PIN16_GPIO_PORT)
#define RET_MUXC_GPIO_PIN  (CONN_PIN16_GPIO_PIN)

#define RET_MUXB_GPIO_CLK  (CONN_PIN15_GPIO_CLK)
#define RET_MUXB_GPIO_PORT (CONN_PIN15_GPIO_PORT)
#define RET_MUXB_GPIO_PIN  (CONN_PIN15_GPIO_PIN)

#define RET_MUXA_GPIO_CLK  (CONN_PIN11_GPIO_CLK)
#define RET_MUXA_GPIO_PORT (CONN_PIN11_GPIO_PORT)
#define RET_MUXA_GPIO_PIN  (CONN_PIN11_GPIO_PIN)

/* Keypad Matrix Definitions */
#define MAX_SC_LINES   (7)

#define NB_SC_4_RT0    (7)
#define NB_SC_4_RT1    (7)
#define NB_SC_4_RT2    (7)
#define NB_SC_4_RT3    (5)

#define SC_NB_MUXED    (7)

#define MAX_RT_LINES   (4)

#define NB_RT_4_SC0    (4)
#define NB_RT_4_SC1    (4)
#define NB_RT_4_SC2    (4)
#define NB_RT_4_SC3    (4)
#define NB_RT_4_SC4    (4)
#define NB_RT_4_SC5    (3)
#define NB_RT_4_SC6    (3)

#define RT_NB_MUXED    (4)

#define NB_KEYS \
(NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2 + NB_RT_4_SC3 + \
 NB_RT_4_SC4 + NB_RT_4_SC5 + NB_RT_4_SC6)

/* Private function prototypes -----------------------------------------------*/
static void KpdInit(void);
static void KpdScan(KEY_VAL_MAP_T * pKeyValueMap, KEY_INFO_T * pKeyInfo);

/* Private constants----------------------------------------------------------*/
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
  NB_RT_4_SC0 + NB_RT_4_SC1 + NB_RT_4_SC2 + NB_RT_4_SC3 + NB_RT_4_SC4 + NB_RT_4_SC5
};

/* Matrix Key code Mapping to BSP Key Value */
static const KEY_VAL_MAP_T KEY_VALUE_MAP_T1[NB_KEYS] = 
{
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { KPD_KEY_DIG1, 0xFF },
  { KPD_KEY_DIG2, 0xFF },
  { KPD_KEY_DIG3, 0xFF },
  { KPD_KEY_DIG4, 0xFF },
  { KPD_KEY_DIG5, 0xFF },
  { KPD_KEY_DIG6, 0xFF },
  { KPD_KEY_DIG7, 0xFF },
  { KPD_KEY_DIG8, 0xFF },
  { KPD_KEY_DIG9, 0xFF },
  { 0xFF, 0xFF },
  { KPD_KEY_DIG0, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { KPD_KEY_AUTO, 0xFF },
  { KPD_KEY_BACK, KPD_KEY_MANUAL },
  { KPD_KEY_MODE, 0xFF },
  { KPD_KEY_NEXT, KPD_KEY_ADD_UV },
  { KPD_KEY_ENT, 0xFF }
};

/* Matrix Key code Mapping to BSP Key Value */
static const KEY_VAL_MAP_T KEY_VALUE_MAP_T2[NB_KEYS] = 
{
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { KPD_KEY_DIG1, KPD_KEY_V2000 },
  { KPD_KEY_DIG2, KPD_KEY_V1000 },
  { KPD_KEY_DIG3, KPD_KEY_V500 },
  { KPD_KEY_DIG4, KPD_KEY_V200 },
  { KPD_KEY_DIG5, KPD_KEY_V100 },
  { KPD_KEY_DIG6, KPD_KEY_V50 },
  { KPD_KEY_DIG7, KPD_KEY_V20 },
  { KPD_KEY_DIG8, KPD_KEY_V10 },
  { KPD_KEY_DIG9, 0xFF },
  { KPD_KEY_ADD, 0xFF },
  { KPD_KEY_DIG0, 0xFF },
  { KPD_KEY_ENT, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { 0xFF, 0xFF },
  { KPD_KEY_MODE, 0xFF },
  { KPD_KEY_UV, 0xFF },
  { KPD_KEY_VALM, 0xFF },
  { KPD_KEY_UP, KPD_KEY_TENS },
  { KPD_KEY_BACK, 0xFF },
  { KPD_KEY_FUNC, 0xFF },
  { KPD_KEY_NEXT, 0xFF },
  { KPD_KEY_DOWN, KPD_KEY_UNITS }
};

/* Public constants ----------------------------------------------------------*/
/* Keypad Type table */
const KPD_TYPE_T KeypadType_26_7x4_NoVal = 
{
  .nbScanLine = MAX_SC_LINES,
  .nbReturnLine = MAX_RT_LINES,
  .nbKeys = NB_KEYS,
  .pKeyValueMap = KEY_VALUE_MAP_T1,
  .kpdInit = KpdInit,
  .kpdScan = KpdScan
};

const KPD_TYPE_T KeypadType_26_7x4_Val = 
{
  .nbScanLine = MAX_SC_LINES,
  .nbReturnLine = MAX_RT_LINES,
  .nbKeys = NB_KEYS,
  .pKeyValueMap = KEY_VALUE_MAP_T2,
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
  GPIO_Init(SCA_DEMA_GPIO_PORT, SCA_DEMA_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(SCA_DEMB_GPIO_PORT, SCA_DEMB_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(SCA_DEMC_GPIO_PORT, SCA_DEMC_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);

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
  GPIO_Init(RET_MUXA_GPIO_PORT, RET_MUXA_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(RET_MUXB_GPIO_PORT, RET_MUXB_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(RET_MUXC_GPIO_PORT, RET_MUXC_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

/**
  * @brief  Clear all Scan Line to Logic Level Low
  * @param  None
  * @retval None
  */
@inline void ClrAllScanLines(void) 
{
  BSP_ClrGPIO(SCA_DEMA_GPIO_PORT, SCA_DEMA_GPIO_PIN);
  BSP_ClrGPIO(SCA_DEMB_GPIO_PORT, SCA_DEMB_GPIO_PIN);
  BSP_ClrGPIO(SCA_DEMC_GPIO_PORT, SCA_DEMC_GPIO_PIN);
}

/**
  * @brief  Set a Scan Line to Logic Level High
  * @param  nb - ranges form 0 to NB_SC_4_RT_DEF - 1
  * @retval None
  */
@inline static void SetScanLine(uint8_t nb)
{
    if((nb) & 0x01)
      BSP_SetGPIO(SCA_DEMA_GPIO_PORT, SCA_DEMA_GPIO_PIN);
    else
      BSP_ClrGPIO(SCA_DEMA_GPIO_PORT, SCA_DEMA_GPIO_PIN);
      
    if((nb) & 0x02)
      BSP_SetGPIO(SCA_DEMB_GPIO_PORT, SCA_DEMB_GPIO_PIN);
    else
      BSP_ClrGPIO(SCA_DEMB_GPIO_PORT, SCA_DEMB_GPIO_PIN);
      
    if((nb) & 0x04) 
      BSP_SetGPIO(SCA_DEMC_GPIO_PORT, SCA_DEMC_GPIO_PIN);
    else
      BSP_ClrGPIO(SCA_DEMC_GPIO_PORT, SCA_DEMC_GPIO_PIN);
}

/**
  * @brief  Get the Logic Level on a Return Line
  * @param  None
  * @retval returns Mux Value
  */
@inline static uint8_t GetReturnVal(void)
{
  uint8_t val = 0;
  val |= (uint8_t)((RET_MUXA_GPIO_PORT->IDR & RET_MUXA_GPIO_PIN) ? 0: 1<<0);
  val |= (uint8_t)((RET_MUXB_GPIO_PORT->IDR & RET_MUXB_GPIO_PIN) ? 0: 1<<1);
  val |= (uint8_t)((RET_MUXC_GPIO_PORT->IDR & RET_MUXC_GPIO_PIN) ? 0: 1<<2);

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
  uint8_t keyNo = 0, scanLine = 0, retLine = 0;
  uint8_t keyPressBit[(NB_KEYS / 8) + ((NB_KEYS % 8) ? (1) : (0)) ] = {0};
  uint32_t bspSysTime = BSP_GetSysTime();
  
  /* Check if any key is pressed in Muxed lines */
  ClrAllScanLines();
  retLine = GetReturnVal();
  
  if(retLine > 0)
  {
    for(scanLine = 0; scanLine < NB_SC_4_RT[retLine - 1]; scanLine++)  
    {
      uint8_t retVal = 0;
      
      SetScanLine((uint8_t)(scanLine + 1));
      retVal = GetReturnVal();
      
      if(retVal == 0)
      {
        keyNo = (uint8_t)(NB_SC_4_RT_ACC[retLine - 1] + scanLine);
        /* change the key press state */
        keyPressBit[keyNo >> 3] |= (uint8_t)(1 << (keyNo & 0x7));
        break;
      }
    }
  }
  
  ClrAllScanLines();


  /* Set Key State */  
  for(keyNo = 0; keyNo < NB_KEYS; keyNo++)
  {
  uint8_t  keyScanNo, keyAltNo, keyPressState;

    keyPressState = (uint8_t)((keyPressBit[keyNo >> 3] & (1 << (keyNo & 0x7))) ? CLOSED : OPEN);
    
    /* Map the Key No to Key Value Index */
    keyScanNo = pKeyValueMap[(uint8_t)keyNo].main;
  keyAltNo = pKeyValueMap[(uint8_t)keyNo].alt;
    
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
}

/***********************END OF FILE************************/