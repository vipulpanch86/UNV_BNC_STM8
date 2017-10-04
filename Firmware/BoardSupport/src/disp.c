/**
  ******************************************************************************
  * @file    disp.c
  * @author  Vipul Panchal
  * @brief   This file contains display related functions
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
/* Single Refresh Rate in Millisec */
#define DISP_REFERSH_MS    (1)
/* Display buffer size */
#define DISP_BUFF_SZ       (32)

/* Segment data for Seven Segment Display */
#define S7_A 0x01
#define S7_B 0x02
#define S7_C 0x04
#define S7_D 0x08
#define S7_E 0x10
#define S7_F 0x20
#define S7_G 0x40

/* Segment data for Sixteen Segment Display */
#define S16_A1 0x0001
#define S16_A2 0x0002
#define S16_B  0x0004
#define S16_C  0x0008
#define S16_D1 0x0010
#define S16_D2 0x0020
#define S16_E  0x0040
#define S16_F  0x0080
#define S16_G1 0x0100
#define S16_G2 0x0200
#define S16_H  0x0400
#define S16_I  0x0800
#define S16_J  0x1000
#define S16_K  0x2000
#define S16_L  0x4000
#define S16_M  0x8000

#define UPPER_DISP_BUFF_OFFSET   (0)
#define LOWER_DISP_BUFF_OFFSET   (pDisp->uppMaxSel)
#define LED_DISP_BUFF_OFFSET     (pDisp->uppMaxSel + pDisp->lowMaxSel)
#define TURRET_DISP_BUFF_OFFSET  (pDisp->uppMaxSel + pDisp->lowMaxSel + DISP_LED_MAX_SEL)

/* Private typedef -----------------------------------------------------------*/

/* External Declaration-------------------------------------------------------*/
extern DISP_TYPE_T DispInfoT16x5B8x4;
extern DISP_TYPE_T DispInfoT16x7B8x4;
extern DISP_TYPE_T DispInfoT8x5B8x3;

/* Private constants----------------------------------------------------------*/
/* Font Table of 16 Segment Display for Numbers */
static const uint16_t SEG_16N[] =
{
  /* 0 */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_E + S16_F,
  /* 1 */ S16_B + S16_C,
  /* 2 */ S16_A1 + S16_A2 + S16_B + S16_G1 + S16_G2 + S16_E + S16_D1 + S16_D2,
  /* 3 */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_G1 + S16_G2,
  /* 4 */ S16_B + S16_C + S16_G1 + S16_G2 + S16_F,
  /* 5 */ S16_A1 + S16_A2 + S16_C + S16_D1 + S16_D2 + S16_F + S16_G1 + S16_G2,
  /* 6 */ S16_A1 + S16_A2 + S16_C + S16_D1 + S16_D2 + S16_E + S16_F + S16_G1 + S16_G2,
  /* 7 */ S16_A1 + S16_A2 + S16_B + S16_C,
  /* 8 */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_E + S16_F + S16_G1 + S16_G2,
  /* 9 */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_F + S16_G1 + S16_G2
};

/* Font Table of 16 Segment Display for alphabets */
static const uint16_t SEG_16A[] =
{
  /* A */ S16_A1 + S16_A2 + S16_B + S16_C + S16_E + S16_F + S16_G1 + S16_G2,
  /* B */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_G2 + S16_I + S16_L,
  /* C */ S16_A1 + S16_A2 + S16_D1 + S16_D2 + S16_E + S16_F,
  /* D */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_I + S16_L,
  /* E */ S16_A1 + S16_A2 + S16_D1 + S16_D2 + S16_E + S16_F + S16_G1 + S16_G2,
  /* F */ S16_A1 + S16_A2 + S16_E + S16_F + S16_G1,
  /* G */ S16_A1 + S16_A2 + S16_C + S16_D1 + S16_D2 + S16_E + S16_F + S16_G2,
  /* H */ S16_B + S16_C + S16_E + S16_F + S16_G1 + S16_G2,
  /* I */ S16_A1 + S16_A2 + S16_I + S16_L + S16_D1 + S16_D2,
  /* J */ S16_B + S16_C + S16_D1 + S16_D2 + S16_E,
  /* K */ S16_E + S16_F + S16_G1 + S16_J + S16_K,
  /* L */ S16_D1 + S16_D2 + S16_E + S16_F,
  /* M */ S16_B + S16_C + S16_E + S16_F + S16_H + S16_J,
  /* N */ S16_B + S16_C + S16_E + S16_F + S16_H + S16_K,
  /* O */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_E + S16_F,
  /* P */ S16_A1 + S16_A2 + S16_B + S16_E + S16_F + S16_G1 + S16_G2,
  /* Q */ S16_A1 + S16_A2 + S16_B + S16_C + S16_D1 + S16_D2 + S16_E + S16_F + S16_K,
  /* R */ S16_A1 + S16_A2 + S16_B + S16_E + S16_F + S16_G1 + S16_G2 + S16_K,
  /* S */ S16_A1 + S16_A2 + S16_C + S16_D1 + S16_D2 + S16_F + S16_G1 + S16_G2,
  /* T */ S16_A1 + S16_A2 + S16_I + S16_L,
  /* U */ S16_B + S16_C + S16_D1 + S16_D2 + S16_E + S16_F,
  /* V */ S16_E + S16_F + S16_J + S16_M,
  /* W */ S16_B + S16_C + S16_E + S16_F + S16_K + S16_M,
  /* X */ S16_H + S16_J + S16_K + S16_M,
  /* Y */ S16_H + S16_J + S16_L,
  /* Z */ S16_A1 + S16_A2 + S16_D1 + S16_D2 + S16_J + S16_M
};

/* Font Table of 7 Segment Display for Numbers */
static const char SEG_7N[] =
{
  /* 0 */ S7_A + S7_B + S7_C + S7_D + S7_E + S7_F,
  /* 1 */ S7_B + S7_C,
  /* 2 */ S7_A + S7_B + S7_D + S7_E + S7_G,
  /* 3 */ S7_A + S7_B + S7_C + S7_D + S7_G,
  /* 4 */ S7_B + S7_C + S7_F + S7_G,
  /* 5 */ S7_A + S7_C + S7_D + S7_F + S7_G,
  /* 6 */ S7_A + S7_C + S7_D + S7_E + S7_F + S7_G,
  /* 7 */ S7_A + S7_B + S7_C,
  /* 8 */ S7_A + S7_B + S7_C + S7_D + S7_E + S7_F + S7_G,
  /* 9 */ S7_A + S7_B + S7_C + S7_D + S7_F + S7_G,
};

/* Font Table of 7 Segment Display for Alphabets */
static const char SEG_7A[] =
{
  /* A */ S7_A + S7_B + S7_C + S7_E + S7_F + S7_G,
  /* B */ S7_C + S7_D + S7_E + S7_F + S7_G,
  /* C */ S7_A + S7_D + S7_E + S7_F,
  /* D */ S7_B + S7_C + S7_D + S7_E + S7_G,
  /* E */ S7_A + S7_D + S7_E + S7_F + S7_G,
  /* F */ S7_A + S7_E + S7_F + S7_G,
  /* G */ S7_A + S7_C + S7_D + S7_E + S7_F,
  /* H */ S7_B + S7_C + S7_E + S7_F + S7_G,
  /* I */ S7_B + S7_C,
  /* J */ S7_B + S7_C + S7_D + S7_E,
  /* K */ S7_B + S7_E + S7_F + S7_G,
  /* L */ S7_D + S7_E + S7_F,
  /* M */ S7_A + S7_C + S7_E + S7_G,
  /* N */ S7_C + S7_E + S7_G,
  /* O */ S7_A + S7_B + S7_C + S7_D + S7_E + S7_F,
  /* P */ S7_A + S7_B + S7_E + S7_F + S7_G,
  /* Q */ S7_A + S7_B + S7_C + S7_F + S7_G,
  /* R */ S7_E + S7_G,
  /* S */ S7_A + S7_C + S7_D + S7_F + S7_G,
  /* T */ S7_D + S7_E + S7_F + S7_G,
  /* U */ S7_B + S7_C + S7_D + S7_E + S7_F,
  /* V */ S7_C + S7_D + S7_E,
  /* W */ S7_A + S7_D + S7_G,
  /* X */ S7_A + S7_D + S7_G,
  /* Y */ S7_B + S7_C + S7_D + S7_F + S7_G,
  /* Z */ S7_D + S7_G
};

/* Dsiplay info table */
static const DISP_TYPE_T * DisplayType[DISP_TYPE_MAX_NB] = 
{
  &DispInfoT16x5B8x4,
  &DispInfoT16x7B8x4,
  &DispInfoT8x5B8x3
};

/* Private variables ---------------------------------------------------------*/
static uint16_t DisplayBuff[DISP_BUFF_SZ];
static uint16_t DispMaxSel;
static uint16_t (*LowDispCalcSegment)(uint8_t);
static uint16_t (*UppDispCalcSegment)(uint8_t);
const DISP_TYPE_T * pDisp = NULL;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Calculates 16 segment data for a character
  * @param  ch - Display to which the data needs to written
  * @retval 16 bit segment data
  */
static uint16_t S16_CalcSegments(uint8_t ch)
{
  if((ch >= 'A') && (ch <= 'Z'))
  {
    return SEG_16A[ch - 'A'];  /* A-Z */
  }
  else if((ch >= 'a') && (ch <= 'z'))
  {
    return SEG_16A[ch - 'a'];  /* a-z */
  }
  else if((ch >= '0') && (ch <= '9'))
  {
    return SEG_16N[ch - '0'];  /* 0-9 */
  }
  else if(ch == '-')
  {
    return S16_G1 + S16_G2;
  }
  else if(ch == '+')
  {
    return S16_G1 + S16_G2 + S16_I + S16_L;
  }
  else if(ch == '<')
  {
    return S16_J + S16_K;
  }
  else if(ch == '>')
  {
    return S16_H + S16_M;
  }
  else if(ch == '/')
  {
    return S16_J + S16_M;
  }
  else
  {
    return 0;  /* blank */
  }
}

/**
  * @brief  Calculates 7 segment data for a character
  * @param  ch - Display to which the data needs to written
  * @retval 8 bit segment data
  */
static uint16_t S7_CalcSegments(uint8_t ch)
{
  if((ch >= 'A') && (ch <= 'Z'))
  {
    return SEG_7A[ch - 'A'];  /* A-Z */
  }
  else if((ch >= 'a') && (ch <= 'z'))
  {
    return SEG_7A[ch - 'a'];  /* a-z */
  }
  else if((ch >= '0') && (ch <= '9'))
  {
    return SEG_7N[ch - '0'];  /* 0-9 */
  }
  else if(ch == '-')
  {
    return S7_G;
  }
  else if(ch == '_')
  {
    return S7_D;
  }
  else
  {
    return 0;
  }
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Initialzation Function for Display
  * @param  None
  * @retval None
  */
void DISP_Init(uint8_t dispIndex)
{
  if(dispIndex < DISP_TYPE_MAX_NB)
  {
    pDisp = DisplayType[dispIndex];
    pDisp->dispInit();
    
    if(pDisp->lowSegType == DISP_SEVEN_SEG)
    {
      LowDispCalcSegment = S7_CalcSegments;
    }
    else
    {
      LowDispCalcSegment = S16_CalcSegments;
    }
    
    if(pDisp->uppSegType == DISP_SEVEN_SEG)
    {
      UppDispCalcSegment = S7_CalcSegments;
    }
    else
    {
      UppDispCalcSegment = S16_CalcSegments;
    }
    
    DispMaxSel = pDisp->uppMaxSel + pDisp->lowMaxSel + DISP_LED_MAX_SEL + DISP_TURRET_MAX_SEL; 
  }
  
  memset(&DisplayBuff, 0x00, sizeof(DisplayBuff));
}

/**
  * @brief  clears the Lower display
  * @param  None
  * @retval None
  */
void DISP_LowerClear(void)
{
  uint8_t count;
  uint8_t dispBuffOffset = LOWER_DISP_BUFF_OFFSET;
  
  for(count = 0; count < pDisp->lowMaxSel; count++)
  {
    DisplayBuff[dispBuffOffset + count] = 0x00;
  }
}

/**
  * @brief  Displays a String on the Lower display
  * @param  pStr - Pointer to the String to be displayed
  *         startDispNo - Start Display No.
  * @retval None
  */
void DISP_LowerPutStr(char *pStr, uint8_t startDispNo)
{
  if(startDispNo < pDisp->lowMaxSel)
  {
    uint8_t count = 0;
    uint8_t strlength = (uint8_t)strlen(pStr);
    uint8_t maxChar = (uint8_t)(((pDisp->lowMaxSel - startDispNo) < strlength) ?
                                (pDisp->lowMaxSel - startDispNo) :
                                (strlength));
    uint8_t dispBuffOffset = LOWER_DISP_BUFF_OFFSET + startDispNo;
    
    for(count = 0; count < maxChar; count++)
    {
      DisplayBuff[dispBuffOffset + count] = LowDispCalcSegment(pStr[count]);
    }
  }
}

/**
  * @brief  clears the upper display
  * @param  None
  * @retval None
  */
void DISP_UpperClear(void)
{
  uint8_t count;
  uint8_t dispBuffOffset = UPPER_DISP_BUFF_OFFSET;

  for(count = 0; count < pDisp->uppMaxSel; count++)
  {
    DisplayBuff[dispBuffOffset + count] = 0;
  }
}

/**
  * @brief  Displays a String on the Upper display
  * @param  pStr - Pointer to the String to be displayed
  *         startDispNo - Start Display No.
  * @retval None
  */
void DISP_UpperPutStr(char *pStr, uint8_t startDispNo)
{
  if(startDispNo < pDisp->uppMaxSel)
  {
    uint8_t count = 0;
    uint8_t strlength = (uint8_t)strlen(pStr);
    uint8_t maxChar = (uint8_t)(((pDisp->uppMaxSel - startDispNo) < strlength) ?
                                (pDisp->uppMaxSel - startDispNo) :
                                (strlength));
    uint8_t dispBuffOffset = UPPER_DISP_BUFF_OFFSET + startDispNo;

    for(count = 0; count < maxChar; count++)
    {
      DisplayBuff[dispBuffOffset + count] = UppDispCalcSegment(pStr[count]);
    }
  }
  //printf("\n\r%s", pStr);
}

/**
  * @brief  clears the turret display
  * @param  None
  * @retval None
  */
void DISP_TurrClear(void)
{
  uint8_t count;
  uint8_t dispBuffOffset = TURRET_DISP_BUFF_OFFSET;

  for(count = 0; count < DISP_TURRET_MAX_SEL; count++)
  {
    DisplayBuff[dispBuffOffset + count] = 0;
  }
}

/**
  * @brief  Displays a String on the Turret display
  * @param  pStr - Pointer to the String to be displayed
  *         startDispNo - Start Display No.
  * @retval None
  */
void DISP_TurrPutStr(char *pStr, uint8_t startDispNo)
{
  if(startDispNo < DISP_TURRET_MAX_SEL)
  {
    uint8_t count = 0;
    uint8_t strlength = (uint8_t)strlen(pStr);
    uint8_t maxChar = (uint8_t)(((DISP_TURRET_MAX_SEL - startDispNo) < strlength) ?
                                (DISP_TURRET_MAX_SEL - startDispNo) :
                                (strlength));
    uint8_t dispBuffOffset = TURRET_DISP_BUFF_OFFSET + startDispNo;

    for(count = 0; count < maxChar; count++)
    {
      DisplayBuff[dispBuffOffset + count] = S7_CalcSegments(pStr[count]);
    }
  }
}

/**
  * @brief  Turns an LED ON/OFF
  * @param  ledNo - Led No to display
  *         enable - ON /OFF
  * @retval None
  */
void DISP_Led(uint8_t ledNo, uint8_t enable)
{
  if(ledNo < DISP_LED_MAX_NB)
  {
    if(enable == TRUE)
    {
      DisplayBuff[LED_DISP_BUFF_OFFSET] |= (uint16_t)(pDisp->pLedBitmap[ledNo]);
    }
    else
    {
      DisplayBuff[LED_DISP_BUFF_OFFSET] &= (uint16_t)(~pDisp->pLedBitmap[ledNo]);
    }
  }
}

/**
  * @brief  Displays all Segments & led's ON
  * @param  None
  * @retval None
  */
void DISP_SetAll(void)
{
  memset(&DisplayBuff[0], 0xFF, sizeof(DisplayBuff));
}

/**
  * @brief  Displays all Segments & led's OFF
  * @param  None
  * @retval None
  */
void DISP_ClearAll(void)
{
  memset(&DisplayBuff[0], 0x00, sizeof(DisplayBuff));
}

/**
  * @brief  Enables a single displays and puts data on it
  * @param  None
  * @retval None
  */
void DISP_Exec(void)
{
  static uint8_t DispNo = 0;

  uint16_t *pDisplayBuff = (uint16_t *)&DisplayBuff;

  pDisp->dispWrite(DispNo, pDisplayBuff[DispNo]);
  DispNo++;
  DispNo %= DispMaxSel;
}
/***********************END OF FILE************************/
