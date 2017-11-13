/**
  ******************************************************************************
  * @file    disp_t16x7b8x4.c
  * @author  Vipul Panchal
  * @brief   This file contains display related functions
  *          specific to display top 7 (16Seg), bottom 4 (7Seg)
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
//#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
/* Board I/Os configuration */
#define DISP_MS0_GPIO_CLK  (CONN_PIN17_GPIO_CLK)
#define DISP_MS0_GPIO_PORT (CONN_PIN17_GPIO_PORT)
#define DISP_MS0_GPIO_PIN  (CONN_PIN17_GPIO_PIN)

#define DISP_MS1_GPIO_CLK  (CONN_PIN18_GPIO_CLK)
#define DISP_MS1_GPIO_PORT (CONN_PIN18_GPIO_PORT)
#define DISP_MS1_GPIO_PIN  (CONN_PIN18_GPIO_PIN)

#define DISP_MS2_GPIO_CLK  (CONN_PIN19_GPIO_CLK)
#define DISP_MS2_GPIO_PORT (CONN_PIN19_GPIO_PORT)
#define DISP_MS2_GPIO_PIN  (CONN_PIN19_GPIO_PIN)

#define DISP_MS3_GPIO_CLK  (CONN_PIN20_GPIO_CLK)
#define DISP_MS3_GPIO_PORT (CONN_PIN20_GPIO_PORT)
#define DISP_MS3_GPIO_PIN  (CONN_PIN20_GPIO_PIN)

#define DISP_LE0_GPIO_CLK  (CONN_PIN22_GPIO_CLK)
#define DISP_LE0_GPIO_PORT (CONN_PIN22_GPIO_PORT)
#define DISP_LE0_GPIO_PIN  (CONN_PIN22_GPIO_PIN)

#define DISP_LE1_GPIO_CLK  (CONN_PIN21_GPIO_CLK)
#define DISP_LE1_GPIO_PORT (CONN_PIN21_GPIO_PORT)
#define DISP_LE1_GPIO_PIN  (CONN_PIN21_GPIO_PIN)

#define DISP_LOE_GPIO_CLK  (CONN_PIN24_GPIO_CLK)
#define DISP_LOE_GPIO_PORT (CONN_PIN24_GPIO_PORT)
#define DISP_LOE_GPIO_PIN  (CONN_PIN24_GPIO_PIN)


/* LED Bitmap defination for Display without Value */
#define T1_LED_VERIFY_BIT     BIT(1)
#define T1_LED_BATCH_BIT      BIT(0)
#define T1_LED_FREE_BIT       BIT(2)
#define T1_LED_STAMP_BIT      BIT(3)
#define T1_LED_MANUAL_BIT     BIT(4)
#define T1_LED_ADD_BIT        BIT(5)
#define T1_LED_UV_BIT         BIT(7)
#define T1_LED_AUTO_BIT       BIT(6)

/* LED Bitmap defination for Display with Value */
#define T2_LED_VERIFY_BIT     BIT(1)
#define T2_LED_BATCH_BIT      BIT(0)
#define T2_LED_FREE_BIT       BIT(2)
#define T2_LED_STAMP_BIT      BIT(3)
#define T2_LED_VALUE_BIT      BIT(5)
#define T2_LED_ADD_BIT        BIT(4)
#define T2_LED_UV_BIT         BIT(7)
#define T2_LED_AUTO_BIT       BIT(6)
#define T2_LED_V_10_BIT       BIT(8)
#define T2_LED_V_20_BIT       BIT(12)
#define T2_LED_V_50_BIT       BIT(10)
#define T2_LED_V_100_BIT      BIT(11)
#define T2_LED_V_500_BIT      BIT(9)
#define T2_LED_V_1000_BIT     BIT(13)


/* Display Number of Segment declaraion */
#define UPPER_MAX_SEL (7)
#define LOWER_MAX_SEL (4)
#define MAX_SEL       (UPPER_MAX_SEL + LOWER_MAX_SEL + \
                       DISP_LED_MAX_SEL)

/* Display Maximum Value Per Display declaraion */
#define UPPER_MAX_VAL (9999999uL)
#define LOWER_MAX_VAL (9999uL)

/* Private function prototypes -----------------------------------------------*/
static void DispInit(void);
static void DispWrite(uint8_t dispNo, volatile uint16_t data);

/* Private constants----------------------------------------------------------*/
/* Display Select Multiplexer Select Pin Table */
static const uint8_t MS_GPIO_PIN[MAX_SEL][4] = 
{
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 1,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 1, DISP_MS2_GPIO_PIN * 0, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 0, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 0,
  DISP_MS0_GPIO_PIN * 1, DISP_MS1_GPIO_PIN * 0, DISP_MS2_GPIO_PIN * 1, DISP_MS3_GPIO_PIN * 0
};

/* Turret Display Select Pin Table */
static const uint8_t TURR_GPIO_PIN[DISP_TURRET_MAX_SEL][4] = 
{
  TURR_DIG0_GPIO_PIN * 1, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 1, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 1, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 1,
};

/* LED Bitmap table for Display without Value */
static const uint16_t LED_BITMAP_T1[DISP_LED_MAX_NB] = 
{
  /* DISP_LED_VERIFY  */ T1_LED_VERIFY_BIT,
  /* DISP_LED_BATCH   */ T1_LED_BATCH_BIT,
  /* DISP_LED_FREE    */ T1_LED_FREE_BIT,
  /* DISP_LED_STAMP   */ T1_LED_STAMP_BIT,
  /* DISP_LED_VALUE   */ 0,
  /* DISP_LED_ADD     */ T1_LED_ADD_BIT,
  /* DISP_LED_UV      */ T1_LED_UV_BIT,
  /* DISP_LED_AUTO    */ T1_LED_AUTO_BIT,
  /* DISP_LED_MANUAL  */ T1_LED_MANUAL_BIT,
  /* DISP_LED_V_10    */ 0,
  /* DISP_LED_V_20    */ 0,
  /* DISP_LED_V_50    */ 0,
  /* DISP_LED_V_100   */ 0,
  /* DISP_LED_V_500   */ 0,
  /* DISP_LED_V_1000  */ 0
};

/* LED Bitmap table for Display with Value */
static const uint16_t LED_BITMAP_T2[DISP_LED_MAX_NB] = 
{
  /* DISP_LED_VERIFY  */ T2_LED_VERIFY_BIT,
  /* DISP_LED_BATCH   */ T2_LED_BATCH_BIT,
  /* DISP_LED_FREE    */ T2_LED_FREE_BIT,
  /* DISP_LED_STAMP   */ T2_LED_STAMP_BIT,
  /* DISP_LED_VALUE   */ T2_LED_VALUE_BIT,
  /* DISP_LED_ADD     */ T2_LED_ADD_BIT,
  /* DISP_LED_UV      */ T2_LED_UV_BIT,
  /* DISP_LED_AUTO    */ T2_LED_AUTO_BIT,
  /* DISP_LED_MANUAL  */ 0,
  /* DISP_LED_V_10    */ T2_LED_V_10_BIT,
  /* DISP_LED_V_20    */ T2_LED_V_20_BIT,
  /* DISP_LED_V_50    */ T2_LED_V_50_BIT,
  /* DISP_LED_V_100   */ T2_LED_V_100_BIT,
  /* DISP_LED_V_500   */ T2_LED_V_500_BIT,
  /* DISP_LED_V_1000  */ T2_LED_V_1000_BIT
};

/* Public constants ----------------------------------------------------------*/
/* Display Info table for Display with Value */
const DISP_TYPE_T DispInfoT16x7B8x4_t1 = 
{
  .uppSegType = DISP_SIXTEEN_SEG,
  .uppMaxSel = UPPER_MAX_SEL,
  .lowSegType = DISP_SEVEN_SEG,
  .lowMaxSel = LOWER_MAX_SEL,
  .uppMaxVal = (uint32_t)UPPER_MAX_VAL,
  .lowMaxVal = (uint32_t)LOWER_MAX_VAL,
  .pLedBitmap = &LED_BITMAP_T1[0],
  .uppFmtStr = "%7lu",
  .lowFmtStr = "%4lu",
  .valWrapChar = 'C',
  .dispInit = DispInit,
  .dispWrite = DispWrite
};

/* Display Info table */
const DISP_TYPE_T DispInfoT16x7B8x4_t2 = 
{
  .uppSegType = DISP_SIXTEEN_SEG,
  .uppMaxSel = UPPER_MAX_SEL,
  .lowSegType = DISP_SEVEN_SEG,
  .lowMaxSel = LOWER_MAX_SEL,
  .uppMaxVal = (uint32_t)UPPER_MAX_VAL,
  .lowMaxVal = (uint32_t)LOWER_MAX_VAL,
  .pLedBitmap = &LED_BITMAP_T2[0],
  .uppFmtStr = "%7lu",
  .lowFmtStr = "%4lu",
  .valWrapChar = 'C',
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
    BSP_SetGPIO(DISP_LE1_GPIO_PORT, DISP_LE1_GPIO_PIN);
    BSP_ClrGPIO(DISP_LE1_GPIO_PORT, DISP_LE1_GPIO_PIN);

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
