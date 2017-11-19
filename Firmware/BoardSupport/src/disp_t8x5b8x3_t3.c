/**
  ******************************************************************************
  * @file    disp_t8x5b8x3.c
  * @author  Vipul Panchal
  * @brief   This file contains display related functions
  *          specific to display top 5 (7Seg), bottom 3 (7Seg)
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
/* Board I/Os configuration */
#define DISP_MUXA_GPIO_PORT (CONN_PIN16_GPIO_PORT)
#define DISP_MUXA_GPIO_PIN  (CONN_PIN16_GPIO_PIN)

#define DISP_MUXB_GPIO_PORT (CONN_PIN18_GPIO_PORT)
#define DISP_MUXB_GPIO_PIN  (CONN_PIN18_GPIO_PIN)

#define DISP_MUXC_GPIO_PORT (CONN_PIN15_GPIO_PORT)
#define DISP_MUXC_GPIO_PIN  (CONN_PIN15_GPIO_PIN)

#define DISP_EN2_GPIO_PORT  (CONN_PIN19_GPIO_PORT)
#define DISP_EN2_GPIO_PIN   (CONN_PIN19_GPIO_PIN)

#define DISP_EN3_GPIO_PORT  (CONN_PIN20_GPIO_PORT)
#define DISP_EN3_GPIO_PIN   (CONN_PIN20_GPIO_PIN)

#define DISP_EN4_GPIO_PORT  (CONN_PIN21_GPIO_PORT)
#define DISP_EN4_GPIO_PIN   (CONN_PIN21_GPIO_PIN)

#define DISP_EN5_GPIO_PORT  (CONN_PIN22_GPIO_PORT)
#define DISP_EN5_GPIO_PIN   (CONN_PIN22_GPIO_PIN)


/* LED Bitmap defination */
#define LED_VERIFY_BIT     BIT(0)
#define LED_BATCH_BIT      BIT(1)
#define LED_FREE_BIT       BIT(2)
#define LED_STAMP_BIT      BIT(3)
#define LED_MANUAL_BIT     BIT(5)
#define LED_ADD_BIT        BIT(6)
#define LED_UV_BIT         BIT(7)
#define LED_AUTO_BIT       BIT(4)

/* Display Number of Segment declaraion */
#define UPPER_MAX_SEL (5)
#define LOWER_MAX_SEL (3)
#define MAX_SEL       (UPPER_MAX_SEL + LOWER_MAX_SEL + \
                       DISP_LED_MAX_SEL)

/* Display Maximum Value Per Display declaraion */
#define UPPER_MAX_VAL (99999uL)
#define LOWER_MAX_VAL (999uL)

/* Private function prototypes -----------------------------------------------*/
static void DispInit(void);
static void DispWrite(uint8_t dispNo, volatile uint16_t data);

/* Private constants----------------------------------------------------------*/
/* Display Select Pin Table */
static const uint8_t MS_GPIO_PIN[MAX_SEL][7] = 
{
  DISP_MUXA_GPIO_PIN * 0, DISP_MUXB_GPIO_PIN * 1, DISP_MUXC_GPIO_PIN * 0, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 0,
  DISP_MUXA_GPIO_PIN * 0, DISP_MUXB_GPIO_PIN * 0, DISP_MUXC_GPIO_PIN * 0, DISP_EN2_GPIO_PIN * 1, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 0,
  DISP_MUXA_GPIO_PIN * 0, DISP_MUXB_GPIO_PIN * 0, DISP_MUXC_GPIO_PIN * 0, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 1, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 0,
  DISP_MUXA_GPIO_PIN * 0, DISP_MUXB_GPIO_PIN * 0, DISP_MUXC_GPIO_PIN * 0, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 1, DISP_EN5_GPIO_PIN * 0,
  DISP_MUXA_GPIO_PIN * 0, DISP_MUXB_GPIO_PIN * 0, DISP_MUXC_GPIO_PIN * 0, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 1,
  DISP_MUXA_GPIO_PIN * 1, DISP_MUXB_GPIO_PIN * 1, DISP_MUXC_GPIO_PIN * 0, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 0,
  DISP_MUXA_GPIO_PIN * 0, DISP_MUXB_GPIO_PIN * 0, DISP_MUXC_GPIO_PIN * 1, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 0,
  DISP_MUXA_GPIO_PIN * 1, DISP_MUXB_GPIO_PIN * 0, DISP_MUXC_GPIO_PIN * 1, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 0,
  DISP_MUXA_GPIO_PIN * 0, DISP_MUXB_GPIO_PIN * 1, DISP_MUXC_GPIO_PIN * 1, DISP_EN2_GPIO_PIN * 0, DISP_EN3_GPIO_PIN * 0, DISP_EN4_GPIO_PIN * 0, DISP_EN5_GPIO_PIN * 0
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
  /* DISP_LED_VALUE   */ 0,
  /* DISP_LED_ADD     */ LED_ADD_BIT,
  /* DISP_LED_UV      */ LED_UV_BIT,
  /* DISP_LED_AUTO    */ LED_AUTO_BIT,
  /* DISP_LED_MANUAL  */ LED_MANUAL_BIT,
  /* DISP_LED_V_10    */ 0,
  /* DISP_LED_V_20    */ 0,
  /* DISP_LED_V_50    */ 0,
  /* DISP_LED_V_100   */ 0,
  /* DISP_LED_V_500   */ 0,
  /* DISP_LED_V_1000  */ 0
};

/* Public constants ----------------------------------------------------------*/
/* Display Info table */
const DISP_TYPE_T DispInfoT8x5B8x3_t3 = 
{
  .uppSegType = DISP_SEVEN_SEG,
  .uppMaxSel  = UPPER_MAX_SEL,
  .lowSegType = DISP_SEVEN_SEG,
  .lowMaxSel  = LOWER_MAX_SEL,
  .pLedBitmap = &LED_BITMAP[0],
  .uppMaxVal = (uint32_t)UPPER_MAX_VAL,
  .lowMaxVal = (uint32_t)LOWER_MAX_VAL,
  .uppFmtStr = "%5lu",
  .lowFmtStr = "%3lu",
  .valWrapChar = 'L',
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
  GPIO_Init(DISP_EN2_GPIO_PORT, DISP_EN2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN3_GPIO_PORT, DISP_EN3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN4_GPIO_PORT, DISP_EN4_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  GPIO_Init(DISP_EN5_GPIO_PORT, DISP_EN5_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);

  /* Configure Display Mux Select bits
     Default State is Low 
  */
  GPIO_Init(DISP_MUXA_GPIO_PORT, DISP_MUXA_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_MUXB_GPIO_PORT, DISP_MUXB_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(DISP_MUXC_GPIO_PORT, DISP_MUXC_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  
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
  BSP_ClrGPIO(DISP_MUXA_GPIO_PORT, DISP_MUXA_GPIO_PIN);
  BSP_ClrGPIO(DISP_MUXB_GPIO_PORT, DISP_MUXB_GPIO_PIN);
  BSP_ClrGPIO(DISP_MUXC_GPIO_PORT, DISP_MUXC_GPIO_PIN);

  BSP_SetGPIO(DISP_EN2_GPIO_PORT, DISP_EN2_GPIO_PIN);
  BSP_SetGPIO(DISP_EN3_GPIO_PORT, DISP_EN3_GPIO_PIN);
  BSP_SetGPIO(DISP_EN4_GPIO_PORT, DISP_EN4_GPIO_PIN);
  BSP_SetGPIO(DISP_EN5_GPIO_PORT, DISP_EN5_GPIO_PIN);


  /* Selects Upper, Lower & LED Display */
  if(dispNo < MAX_SEL)
  {
    /* Write Byte on Port */
    data8bit = (uint8_t)((data >> 0) & 0xFF);
    DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
  
    /* Output Enable*/
    BSP_SetGPIO(DISP_MUXA_GPIO_PORT, MS_GPIO_PIN[dispNo][0]);
    BSP_SetGPIO(DISP_MUXB_GPIO_PORT, MS_GPIO_PIN[dispNo][1]);
    BSP_SetGPIO(DISP_MUXC_GPIO_PORT, MS_GPIO_PIN[dispNo][2]);
  
    BSP_ClrGPIO(DISP_EN2_GPIO_PORT, MS_GPIO_PIN[dispNo][3]);
    BSP_ClrGPIO(DISP_EN3_GPIO_PORT, MS_GPIO_PIN[dispNo][4]);
    BSP_ClrGPIO(DISP_EN4_GPIO_PORT, MS_GPIO_PIN[dispNo][5]);
    BSP_ClrGPIO(DISP_EN5_GPIO_PORT, MS_GPIO_PIN[dispNo][6]);
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
