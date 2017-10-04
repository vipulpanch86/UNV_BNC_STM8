/**
  ******************************************************************************
  * @file    switch.h
  * @author  Vipul Panchal
  * @brief   This file contains definitions for Switch input resources.
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SWITCH_H
#define __SWITCH_H

#ifdef __cplusplus
extern "C" {
#endif

/* Switch Press Status */
#define SW_RELEASED                   (0)
#define SW_PRESSED                    (1)

/* Switch Status Definition */
#define SW_STATE_IDLE                 (0)
#define SW_STATE_PRESSED              (1)
#define SW_STATE_RELEASED             (2)

/* Switch Index Definitions */
typedef enum
{
  SW_RESET,
  SW_CAM,
  SW_AUTO,
  SW_MAX
} SW_LIST_T; 

/* Switch info struct */
typedef struct
{
  uint8_t  state;
  uint8_t  press;
  uint8_t  debounce;
  uint32_t backuptime;
}SW_INFO_T;

void SW_Init(uint8_t debounce, void (* cb)(uint8_t, uint8_t));
void SW_Scan(void);
uint8_t SW_IsPressed(uint8_t swNo);
void SW_SetDebounceTime(uint8_t debounce);
uint8_t SW_GetDebounceTime(void);
void SW_AddEventListener(void (* cb)(uint8_t, uint8_t));

#ifdef __cplusplus
}
#endif

#endif /* __SWITCH_H */

/******************************END OF FILE*****/
