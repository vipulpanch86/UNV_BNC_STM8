/**
  ******************************************************************************
  * @file    disp_t8x5b8x3.c
  * @author  Vipul Panchal
  * @brief   This file contains display related functions
  *          specific to display top 5 (7Seg), bottom 3 (7Seg)
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
/* Board I/Os configuration */
#define DISP_EN1_GPIO_CLK  (CONN_PIN11_GPIO_CLK)
#define DISP_EN1_GPIO_PORT (CONN_PIN11_GPIO_PORT)
#define DISP_EN1_GPIO_PIN  (CONN_PIN11_GPIO_PIN)

#define DISP_EN2_GPIO_CLK  (CONN_PIN19_GPIO_CLK)
#define DISP_EN2_GPIO_PORT (CONN_PIN19_GPIO_PORT)
#define DISP_EN2_GPIO_PIN  (CONN_PIN19_GPIO_PIN)

#define DISP_EN3_GPIO_CLK  (CONN_PIN20_GPIO_CLK)
#define DISP_EN3_GPIO_PORT (CONN_PIN20_GPIO_PORT)
#define DISP_EN3_GPIO_PIN  (CONN_PIN20_GPIO_PIN)

#define DISP_EN4_GPIO_CLK  (CONN_PIN21_GPIO_CLK)
#define DISP_EN4_GPIO_PORT (CONN_PIN21_GPIO_PORT)
#define DISP_EN4_GPIO_PIN  (CONN_PIN21_GPIO_PIN)

#define DISP_EN5_GPIO_CLK  (CONN_PIN22_GPIO_CLK)
#define DISP_EN5_GPIO_PORT (CONN_PIN22_GPIO_PORT)
#define DISP_EN5_GPIO_PIN  (CONN_PIN22_GPIO_PIN)

#define DISP_EN6_GPIO_CLK  (CONN_PIN16_GPIO_CLK)
#define DISP_EN6_GPIO_PORT (CONN_PIN16_GPIO_PORT)
#define DISP_EN6_GPIO_PIN  (CONN_PIN16_GPIO_PIN)

#define DISP_EN7_GPIO_CLK  (CONN_PIN17_GPIO_CLK)
#define DISP_EN7_GPIO_PORT (CONN_PIN17_GPIO_PORT)
#define DISP_EN7_GPIO_PIN  (CONN_PIN17_GPIO_PIN)

#define DISP_EN8_GPIO_CLK  (CONN_PIN18_GPIO_CLK)
#define DISP_EN8_GPIO_PORT (CONN_PIN18_GPIO_PORT)
#define DISP_EN8_GPIO_PIN  (CONN_PIN18_GPIO_PIN)

#define DISP_EN9_GPIO_CLK  (CONN_PIN15_GPIO_CLK)
#define DISP_EN9_GPIO_PORT (CONN_PIN15_GPIO_PORT)
#define DISP_EN9_GPIO_PIN  (CONN_PIN15_GPIO_PIN)

/* LED Bitmap defination - Type 2 */
#define T1_LED_VERIFY_BIT     BIT(6)
#define T1_LED_BATCH_BIT      BIT(5)
#define T1_LED_FREE_BIT       BIT(4)
#define T1_LED_STAMP_BIT      BIT(7)
#define T1_LED_VALUE_BIT      BIT(0)
#define T1_LED_ADD_BIT        BIT(1)
#define T1_LED_UV_BIT         BIT(3)
#define T1_LED_AUTO_BIT       BIT(2)

/* LED Bitmap defination - Type 3 */
#define T2_LED_VERIFY_BIT     BIT(0)
#define T2_LED_BATCH_BIT      BIT(1)
#define T2_LED_FREE_BIT       BIT(2)
#define T2_LED_STAMP_BIT      BIT(3)
#define T2_LED_VALUE_BIT      BIT(5)
#define T2_LED_ADD_BIT        BIT(6)
#define T2_LED_UV_BIT         BIT(7)
#define T2_LED_AUTO_BIT       BIT(4)

/* Display Number of Segment declaraion */
#define UPPER_MAX_SEL (5)
#define LOWER_MAX_SEL (3)
#define MAX_SEL       (UPPER_MAX_SEL + LOWER_MAX_SEL + \
                       DISP_LED_MAX_SEL)

/* Display Maximum Value Per Display declaraion */
#define UPPER_MAX_VAL (99999)
#define LOWER_MAX_VAL (999)

/* Private function prototypes -----------------------------------------------*/
static void DispInit(void);
static void DispWrite(uint8_t dispNo, volatile uint16_t data);

/* Private constants----------------------------------------------------------*/
/* Display Select Port Pin Table */
static GPIO_TypeDef *DISP_EN_GPIO_PORT[MAX_SEL] =
{
  DISP_EN1_GPIO_PORT,
  DISP_EN2_GPIO_PORT,
  DISP_EN3_GPIO_PORT,
  DISP_EN4_GPIO_PORT,
  DISP_EN5_GPIO_PORT,
  DISP_EN6_GPIO_PORT,
  DISP_EN7_GPIO_PORT,
  DISP_EN8_GPIO_PORT,
  DISP_EN9_GPIO_PORT
};

static const uint16_t DISP_EN_GPIO_PIN[MAX_SEL] =
{
  DISP_EN1_GPIO_PIN,
  DISP_EN2_GPIO_PIN,
  DISP_EN3_GPIO_PIN,
  DISP_EN4_GPIO_PIN,
  DISP_EN5_GPIO_PIN,
  DISP_EN6_GPIO_PIN,
  DISP_EN7_GPIO_PIN,
  DISP_EN8_GPIO_PIN,
  DISP_EN9_GPIO_PIN
};

/* Turret Display Select Pin Table */
static const uint16_t TURR_GPIO_PIN[DISP_TURRET_MAX_SEL][4] = 
{
  TURR_DIG0_GPIO_PIN * 1, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 1, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 1, TURR_DIG3_GPIO_PIN * 0,
  TURR_DIG0_GPIO_PIN * 0, TURR_DIG1_GPIO_PIN * 0, TURR_DIG2_GPIO_PIN * 0, TURR_DIG3_GPIO_PIN * 1,
};

/* Led bitmap table - Type 1 */
static const uint16_t LED_BITMAP_T1[DISP_LED_MAX_NB] = 
{
  /* DISP_LED_VERIFY  */ T1_LED_VERIFY_BIT,
  /* DISP_LED_BATCH   */ T1_LED_BATCH_BIT,
  /* DISP_LED_FREE    */ T1_LED_FREE_BIT,
  /* DISP_LED_STAMP   */ T1_LED_STAMP_BIT,
  /* DISP_LED_VALUE   */ T1_LED_VALUE_BIT,
  /* DISP_LED_ADD     */ T1_LED_ADD_BIT,
  /* DISP_LED_UV      */ T1_LED_UV_BIT,
  /* DISP_LED_AUTO    */ T1_LED_AUTO_BIT,
  /* DISP_LED_MANUAL  */ 0,
  /* DISP_LED_V_10    */ 0,
  /* DISP_LED_V_20    */ 0,
  /* DISP_LED_V_50    */ 0,
  /* DISP_LED_V_100   */ 0,
  /* DISP_LED_V_500   */ 0,
  /* DISP_LED_V_1000  */ 0
};

/* Led bitmap table - Type 2 */
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
  /* DISP_LED_V_10    */ 0,
  /* DISP_LED_V_20    */ 0,
  /* DISP_LED_V_50    */ 0,
  /* DISP_LED_V_100   */ 0,
  /* DISP_LED_V_500   */ 0,
  /* DISP_LED_V_1000  */ 0
};

/* Public constants ----------------------------------------------------------*/
/* Display Info table */
const DISP_TYPE_T DispInfoT8x5B8x3_t1 = 
{
  .uppSegType = DISP_SEVEN_SEG,
  .uppMaxSel  = UPPER_MAX_SEL,
  .lowSegType = DISP_SEVEN_SEG,
  .lowMaxSel  = LOWER_MAX_SEL,
	.uppMaxVal = UPPER_MAX_VAL,
	.lowMaxVal = LOWER_MAX_VAL,
  .pLedBitmap = &LED_BITMAP_T1[0],
  .uppFmtStr = "%5lu",
  .lowFmtStr = "%3lu",
	.valWrapChar = 'L',
  .dispInit   = DispInit,
  .dispWrite  = DispWrite
};

/* Display Info table */
const DISP_TYPE_T DispInfoT8x5B8x3_t2 = 
{
  .uppSegType = DISP_SEVEN_SEG,
  .uppMaxSel  = UPPER_MAX_SEL,
  .lowSegType = DISP_SEVEN_SEG,
  .lowMaxSel  = LOWER_MAX_SEL,
  .pLedBitmap = &LED_BITMAP_T2[0],
  .uppFmtStr = "%5lu",
  .lowFmtStr = "%3lu",
  .dispInit   = DispInit,
  .dispWrite  = DispWrite
};
/* Private variables ---------------------------------------------------------*/


/* Private function prototypes -----------------------------------------------*/
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
  
  /* Configure Display Enable bits
     Default State is High 
  */
  GPIO_Init(DISP_EN1_GPIO_PORT, DISP_EN1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN2_GPIO_PORT, DISP_EN2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN3_GPIO_PORT, DISP_EN3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN4_GPIO_PORT, DISP_EN4_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN5_GPIO_PORT, DISP_EN5_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN6_GPIO_PORT, DISP_EN6_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN7_GPIO_PORT, DISP_EN7_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN8_GPIO_PORT, DISP_EN8_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN9_GPIO_PORT, DISP_EN9_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
	
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
  TURR_DIG0_GPIO_PORT->ODR |= TURR_DIG0_GPIO_PIN;
  TURR_DIG1_GPIO_PORT->ODR |= TURR_DIG1_GPIO_PIN;
  TURR_DIG2_GPIO_PORT->ODR |= TURR_DIG2_GPIO_PIN;
  TURR_DIG3_GPIO_PORT->ODR |= TURR_DIG3_GPIO_PIN;
  /* Output Disable */
  DISP_EN1_GPIO_PORT->ODR |= (uint8_t)DISP_EN1_GPIO_PIN;
  DISP_EN2_GPIO_PORT->ODR |= (uint8_t)DISP_EN2_GPIO_PIN;
  DISP_EN3_GPIO_PORT->ODR |= (uint8_t)DISP_EN3_GPIO_PIN;
  DISP_EN4_GPIO_PORT->ODR |= (uint8_t)DISP_EN4_GPIO_PIN;
  DISP_EN5_GPIO_PORT->ODR |= (uint8_t)DISP_EN5_GPIO_PIN;
  DISP_EN6_GPIO_PORT->ODR |= (uint8_t)DISP_EN6_GPIO_PIN;
  DISP_EN7_GPIO_PORT->ODR |= (uint8_t)DISP_EN7_GPIO_PIN;
  DISP_EN8_GPIO_PORT->ODR |= (uint8_t)DISP_EN8_GPIO_PIN;
  DISP_EN9_GPIO_PORT->ODR |= (uint8_t)DISP_EN9_GPIO_PIN;

  /* Selects Upper, Lower & LED Display */
  if(dispNo < MAX_SEL)
  {
    /* Write Byte on Port */
    data8bit = (uint8_t)((data >> 0) & 0xFF);
    DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
    /* Output Enable*/
  	DISP_EN_GPIO_PORT[dispNo]->ODR &= (uint8_t)~DISP_EN_GPIO_PIN[dispNo];
  }
  /* Selects Turret Display */
  else if(dispNo < (MAX_SEL + DISP_TURRET_MAX_SEL))
  {
  
    dispNo -= MAX_SEL;
	
    /* Write Byte on Port */
    data8bit = (uint8_t)((data >> 0) & 0xFF);
    DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;

    /* Select Corresponding Turret Display */
    TURR_DIG0_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][0];
    TURR_DIG1_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][1];
    TURR_DIG2_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][2];
    TURR_DIG3_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][3];
  }
}
/***********************END OF FILE************************/
