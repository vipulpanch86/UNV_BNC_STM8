/**
  ******************************************************************************
  * @file    disp_t16x5b8x4.c
  * @author  Vipul Panchal
  * @brief   This file contains display related functions
  *          specific to display top 5 (16Seg), bottom 4 (7Seg)
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
/* Board I/Os configuration */
#define DISP_MS0_GPIO_CLK  (CONN_PIN14_GPIO_CLK)
#define DISP_MS0_GPIO_PORT (CONN_PIN14_GPIO_PORT)
#define DISP_MS0_GPIO_PIN  (CONN_PIN14_GPIO_PIN)

#define DISP_MS1_GPIO_CLK  (CONN_PIN15_GPIO_CLK)
#define DISP_MS1_GPIO_PORT (CONN_PIN15_GPIO_PORT)
#define DISP_MS1_GPIO_PIN  (CONN_PIN15_GPIO_PIN)

#define DISP_MS2_GPIO_CLK  (CONN_PIN16_GPIO_CLK)
#define DISP_MS2_GPIO_PORT (CONN_PIN16_GPIO_PORT)
#define DISP_MS2_GPIO_PIN  (CONN_PIN16_GPIO_PIN)

#define DISP_MS3_GPIO_CLK  (CONN_PIN22_GPIO_CLK)
#define DISP_MS3_GPIO_PORT (CONN_PIN22_GPIO_PORT)
#define DISP_MS3_GPIO_PIN  (CONN_PIN22_GPIO_PIN)

#define DISP_LE0_GPIO_CLK  (CONN_PIN17_GPIO_CLK)
#define DISP_LE0_GPIO_PORT (CONN_PIN17_GPIO_PORT)
#define DISP_LE0_GPIO_PIN  (CONN_PIN17_GPIO_PIN)

#define DISP_LE1_GPIO_CLK  (CONN_PIN24_GPIO_CLK)
#define DISP_LE1_GPIO_PORT (CONN_PIN24_GPIO_PORT)
#define DISP_LE1_GPIO_PIN  (CONN_PIN24_GPIO_PIN)

#define DISP_LOE_GPIO_CLK  (CONN_PIN18_GPIO_CLK)
#define DISP_LOE_GPIO_PORT (CONN_PIN18_GPIO_PORT)
#define DISP_LOE_GPIO_PIN  (CONN_PIN18_GPIO_PIN)

/* LED Bitmap defination */
#define LED_VERIFY_BIT     BIT(0)
#define LED_BATCH_BIT      BIT(1)
#define LED_FREE_BIT       BIT(2)
#define LED_STAMP_BIT      BIT(3)
#define LED_VALUE_BIT      BIT(4)
#define LED_ADD_BIT        BIT(5)
#define LED_UV_BIT         BIT(6)
#define LED_AUTO_BIT       BIT(7)
#define LED_V_10_BIT       BIT(8)
#define LED_V_20_BIT       BIT(9)
#define LED_V_50_BIT       BIT(10)
#define LED_V_100_BIT      BIT(11)
#define LED_V_200_BIT      BIT(11)
#define LED_V_500_BIT      BIT(12)
#define LED_V_1000_BIT     BIT(13)
#define LED_V_2000_BIT     BIT(13)

/* Display Number of Segment declaraion */
#define UPPER_MAX_SEL (5)
#define LOWER_MAX_SEL (4)
#define MAX_SEL       (UPPER_MAX_SEL + LOWER_MAX_SEL + \
                       DISP_LED_MAX_SEL)

/* Display Maximum Value Per Display declaraion */
#define UPPER_MAX_VAL (99999uL)
#define LOWER_MAX_VAL (9999uL)


/* Private function prototypes -----------------------------------------------*/
static void DispInit(void);
static void DispWrite(uint8_t dispNo, volatile uint16_t data);

/* Private constants----------------------------------------------------------*/
/* Display Select Multiplexer Select Pin Table */
static const uint8_t MS_GPIO_PIN[MAX_SEL][4] = 
{
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 1
};

/* Turret Display Select Pin Table */
static const uint8_t TURR_GPIO_PIN[DISP_TURRET_MAX_SEL][4] = 
{
  TURR_DIG0_GPIO_PIN * 1, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 1, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 1, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 1,
};

/* Led bitmap table */
static const uint16_t LED_BITMAP[DISP_LED_MAX_NB] = 
{
  /* DISP_LED_VERIFY  */ LED_VERIFY_BIT,
  /* DISP_LED_BATCH   */ LED_BATCH_BIT,
  /* DISP_LED_FREE    */ LED_FREE_BIT,
  /* DISP_LED_STAMP   */ LED_STAMP_BIT,
  /* DISP_LED_VALUE   */ LED_VALUE_BIT,
  /* DISP_LED_ADD     */ LED_ADD_BIT,
  /* DISP_LED_UV      */ LED_UV_BIT,
  /* DISP_LED_AUTO    */ LED_AUTO_BIT,
  /* DISP_LED_MANUAL  */ 0,
  /* DISP_LED_V_10    */ LED_V_10_BIT,
  /* DISP_LED_V_20    */ LED_V_20_BIT,
  /* DISP_LED_V_50    */ LED_V_50_BIT,
  /* DISP_LED_V_100   */ LED_V_100_BIT,
  /* DISP_LED_V_200   */ LED_V_200_BIT,
  /* DISP_LED_V_500   */ LED_V_500_BIT,
  /* DISP_LED_V_1000  */ LED_V_1000_BIT,
  /* DISP_LED_V_2000  */ LED_V_2000_BIT
};

/* Public constants ----------------------------------------------------------*/
/* Display Info table */
const DISP_TYPE_T DispInfoT16x5B8x4 = 
{
  .uppSegType = DISP_SIXTEEN_SEG,
  .uppMaxSel = UPPER_MAX_SEL,
  .lowSegType = DISP_SEVEN_SEG,
  .lowMaxSel = LOWER_MAX_SEL,
  .uppMaxVal = (uint32_t)UPPER_MAX_VAL,
  .lowMaxVal = (uint32_t)LOWER_MAX_VAL,
  .pLedBitmap = &LED_BITMAP[0],
  .uppFmtStr = "%5lu",
  .lowFmtStr = "%4lu",
  .valWrapChar = 'L',
  .modeCharEnable = TRUE,
  .dispInit = DispInit,
  .dispWrite = DispWrite
};
/* Private variables ---------------------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Initialzation Function for Display
  * @param  None
  * @retval None
  */
static void DispInit(void)
{
  /* Configure the Data Port as Output
     Default State is LOW 
  */
  GPIO_Init(DISP_DB0_GPIO_PORT, DISP_DB0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_DB1_GPIO_PORT, DISP_DB1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_DB2_GPIO_PORT, DISP_DB2_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_DB3_GPIO_PORT, DISP_DB3_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_DB4_GPIO_PORT, DISP_DB4_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_DB5_GPIO_PORT, DISP_DB5_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_DB6_GPIO_PORT, DISP_DB6_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_DB7_GPIO_PORT, DISP_DB7_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  
  /* Configure Display Latch Output Enable bit
     Default State is High 
  */
  GPIO_Init(DISP_LOE_GPIO_PORT, DISP_LOE_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  
  /* Configure Display Latch Enable bits
     Default State is Low 
  */
  GPIO_Init(DISP_LE0_GPIO_PORT, DISP_LE0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_LE1_GPIO_PORT, DISP_LE1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  
  /* Configure Display Multiplexer Select bits
     Default State is Low 
  */
  GPIO_Init(DISP_MS0_GPIO_PORT, DISP_MS0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_MS1_GPIO_PORT, DISP_MS1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_MS2_GPIO_PORT, DISP_MS2_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_MS3_GPIO_PORT, DISP_MS3_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);

  /* Configure Customer Display Enable bits
     Default State is High 
  */
  GPIO_Init(TURR_DIG0_GPIO_PORT, TURR_DIG0_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(TURR_DIG1_GPIO_PORT, TURR_DIG1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(TURR_DIG2_GPIO_PORT, TURR_DIG2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(TURR_DIG3_GPIO_PORT, TURR_DIG3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
}

/**
  * @brief  Writes the actual data to display
  * @param  dispNo - Display to which the data needs to written
  *         data - Data to be written to display
  * @retval None
  */
static void DispWrite(uint8_t dispNo, volatile uint16_t data)
{
  volatile uint8_t data8bit = 0;
  
  /* Turret Disable */
  BSP_SetGPIO(TURR_DIG0_GPIO_PORT, TURR_DIG0_GPIO_PIN);
  BSP_SetGPIO(TURR_DIG1_GPIO_PORT, TURR_DIG1_GPIO_PIN);
  BSP_SetGPIO(TURR_DIG2_GPIO_PORT, TURR_DIG2_GPIO_PIN);
  BSP_SetGPIO(TURR_DIG3_GPIO_PORT, TURR_DIG3_GPIO_PIN);
  
  /* Output Disable */
  BSP_SetGPIO(DISP_LOE_GPIO_PORT, DISP_LOE_GPIO_PIN);
  
  /* Selects Upper, Lower & LED Display */
  if(dispNo < MAX_SEL)
  {
    /* Write Low Byte on Port */
    data8bit = (uint8_t)((data >> 0) & 0xFF);
    DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;

    /* Latch Low byte */
    BSP_SetGPIO(DISP_LE0_GPIO_PORT, DISP_LE0_GPIO_PIN);
    BSP_ClrGPIO(DISP_LE0_GPIO_PORT, DISP_LE0_GPIO_PIN);
    
    /* Write High Byte on Port */
    data8bit = (uint8_t)((data >> 8) & 0xFF);
    DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;

    /* Latch High byte */
    BSP_ClrGPIO(DISP_LE1_GPIO_PORT, DISP_LE1_GPIO_PIN);
    BSP_SetGPIO(DISP_LE1_GPIO_PORT, DISP_LE1_GPIO_PIN);

    /* Select the Corresponding Display */
    BSP_ClrGPIO(DISP_MS3_GPIO_PORT, DISP_MS3_GPIO_PIN);
    BSP_SetGPIO(DISP_MS3_GPIO_PORT, MS_GPIO_PIN[dispNo][3]);

    BSP_ClrGPIO(DISP_MS2_GPIO_PORT, DISP_MS2_GPIO_PIN);
    BSP_SetGPIO(DISP_MS2_GPIO_PORT, MS_GPIO_PIN[dispNo][2]);

    BSP_ClrGPIO(DISP_MS1_GPIO_PORT, DISP_MS1_GPIO_PIN);
    BSP_SetGPIO(DISP_MS1_GPIO_PORT, MS_GPIO_PIN[dispNo][1]);

    BSP_ClrGPIO(DISP_MS0_GPIO_PORT, DISP_MS0_GPIO_PIN);
    BSP_SetGPIO(DISP_MS0_GPIO_PORT, MS_GPIO_PIN[dispNo][0]);

    /* Output Enable*/
    BSP_ClrGPIO(DISP_LOE_GPIO_PORT, DISP_LOE_GPIO_PIN);
  }
  /* Selects Turret Display */
  else if(dispNo < (MAX_SEL + DISP_TURRET_MAX_SEL))
  {
  
    dispNo -= MAX_SEL;
  
    /* Write Byte on Port */
    data8bit = (uint8_t)((data >> 0) & 0xFF);
    DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;

    /* Select Corresponding Turret Display */
    BSP_ClrGPIO(TURR_DIG0_GPIO_PORT, TURR_GPIO_PIN[dispNo][0]);
    BSP_ClrGPIO(TURR_DIG1_GPIO_PORT, TURR_GPIO_PIN[dispNo][1]);
    BSP_ClrGPIO(TURR_DIG2_GPIO_PORT, TURR_GPIO_PIN[dispNo][2]);
    BSP_ClrGPIO(TURR_DIG3_GPIO_PORT, TURR_GPIO_PIN[dispNo][3]);
  }
}
/***********************END OF FILE************************/
