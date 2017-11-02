/**
  ******************************************************************************
  * @file    disp.h
  * @author  Vipul Panchal
  * @brief   This file contains definitions for display resources.
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DISP_H
#define __DISP_H

#ifdef __cplusplus
extern "C" {
#endif

/* No of select lines for LED & Turret
   The Led and tirret select lines are 
   common across all display combinations
  */
#define DISP_LED_MAX_SEL      (1)
#define DISP_TURRET_MAX_SEL   (4)

/* Index definition for seven and sixteen segment display */
#define DISP_SEVEN_SEG        (0)
#define DISP_SIXTEEN_SEG      (1)

/* Format Specifier for display strings */
#define DISP_LOWER_STR_FORMAT (pDisp->lowFmtStr)
#define DISP_UPPER_STR_FORMAT (pDisp->uppFmtStr)
#define DISP_TURR_STR_FORMAT  "%4lu"

/* Max Value definition for display strings */
#define DISP_LOWER_MAX_VALUE  ((uint32_t)(pDisp->lowMaxVal))
#define DISP_UPPER_MAX_VALUE  ((uint32_t)(pDisp->uppMaxVal))
#define DISP_TURRET_MAX_VALUE (9999)

/* Max display definition */
#define DISP_LOWER_MAX_NB    (pDisp->lowMaxSel)
#define DISP_UPPER_MAX_NB    (pDisp->uppMaxSel)
#define DISP_TURRET_MAX_NB   (4)

/* Display Wrap Character Definition */
#define DISP_WRAP_CHAR       (pDisp->valWrapChar)
  
/* Pending - need to decide proper place */
#define BIT(n)  (1<<(n))
  
typedef void ( *F_DISP_INIT )( void );
typedef void ( *F_DISP_WRITE )( uint8_t, uint16_t );

typedef struct
{
  const uint8_t   uppSegType;
  const uint8_t   uppMaxSel;
  const uint8_t   lowSegType;
  const uint8_t   lowMaxSel;
	const uint32_t  uppMaxVal;
	const uint32_t  lowMaxVal;
  const uint16_t  *pLedBitmap;
  const char *    uppFmtStr;
  const char *    lowFmtStr;
	const char      valWrapChar;
  F_DISP_INIT     dispInit;
  F_DISP_WRITE    dispWrite;
} DISP_TYPE_T;

typedef enum 
{
  DISP_LED_VERIFY,
  DISP_LED_BATCH,
  DISP_LED_FREE,
  DISP_LED_STAMP,
  DISP_LED_VALUE,
  DISP_LED_ADD,
  DISP_LED_UV,
  DISP_LED_AUTO,
  DISP_LED_MANUAL,
  DISP_LED_V_10,
  DISP_LED_V_20,
  DISP_LED_V_50,
  DISP_LED_V_100,
  DISP_LED_V_500,
  DISP_LED_V_1000,
  DISP_LED_MAX_NB
}DISP_LED_NB_T;

typedef enum 
{
  DISP_TYPE_T8X5B8X3_T1,
	DISP_TYPE_T8X5B8X3_T2,
	DISP_TYPE_T8X5B8X3_T3,
  DISP_TYPE_T16X5B8X4,
  DISP_TYPE_T16X7B8X4,
  DISP_TYPE_MAX_NB
}DISP_TYPE_NB_T;

extern const DISP_TYPE_T * pDisp;
  
void DISP_Init(uint8_t dispIndex);
void DISP_Enable(void);
void DISP_Disable(void);
void DISP_LowerClear(void);
void DISP_LowerPutStr(char *pStr, uint8_t startDispNo);
void DISP_UpperClear(void);
void DISP_UpperPutStr(char *pStr, uint8_t startDispNo);
void DISP_TurrClear(void);
void DISP_TurrPutStr(char *pStr, uint8_t startDispNo);
void DISP_Led(uint8_t ledNo, uint8_t enable);
void DISP_WriteRAW(uint8_t dispNo, uint16_t data);
void DISP_SetAll(void);
void DISP_ClearAll(void);
void DISP_Exec(void);

#ifdef __cplusplus
}
#endif

#endif /* __DISP_H */

/******************************END OF FILE*****/
