/**
  ******************************************************************************
  * @file    bsp.h
  * @author  Vipul Panchal
  * @brief   This file contains the board related definitions.
  ******************************************************************************
  */


/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BSP_H
#define __BSP_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Contains the description of all STM8 hardware registers */
#include "stm8s.h"

/* Private define ------------------------------------------------------------*/
#define BSP_SW_VERSION        100

#define OPEN                  (0)
#define CLOSED                (1)

#define LOW                   (0)
#define HIGH                  (1)

#define BIT(n)                (1<<(n))

#define CONN_PIN3_GPIO_PORT   (GPIOD)
#define CONN_PIN3_GPIO_PIN    (GPIO_PIN_0)

#define CONN_PIN4_GPIO_PORT   (GPIOD)
#define CONN_PIN4_GPIO_PIN    (GPIO_PIN_1)

#define CONN_PIN5_GPIO_PORT   (GPIOD)
#define CONN_PIN5_GPIO_PIN    (GPIO_PIN_2)

#define CONN_PIN6_GPIO_PORT   (GPIOD)
#define CONN_PIN6_GPIO_PIN    (GPIO_PIN_3)

#define CONN_PIN7_GPIO_PORT   (GPIOD)
#define CONN_PIN7_GPIO_PIN    (GPIO_PIN_4)

#define CONN_PIN8_GPIO_PORT   (GPIOD)
#define CONN_PIN8_GPIO_PIN    (GPIO_PIN_5)

#define CONN_PIN9_GPIO_PORT   (GPIOD)
#define CONN_PIN9_GPIO_PIN    (GPIO_PIN_6)

#define CONN_PIN10_GPIO_PORT  (GPIOD)
#define CONN_PIN10_GPIO_PIN   (GPIO_PIN_7)

#define CONN_PIN11_GPIO_PORT  (GPIOG)
#define CONN_PIN11_GPIO_PIN   (GPIO_PIN_7)

#define CONN_PIN12_GPIO_PORT  (GPIOG)
#define CONN_PIN12_GPIO_PIN   (GPIO_PIN_6)

#define CONN_PIN13_GPIO_PORT  (GPIOG)
#define CONN_PIN13_GPIO_PIN   (GPIO_PIN_5)

#define CONN_PIN14_GPIO_PORT  (GPIOG)
#define CONN_PIN14_GPIO_PIN   (GPIO_PIN_4)

#define CONN_PIN15_GPIO_PORT  (GPIOG)
#define CONN_PIN15_GPIO_PIN   (GPIO_PIN_3)

#define CONN_PIN16_GPIO_PORT  (GPIOG)
#define CONN_PIN16_GPIO_PIN   (GPIO_PIN_2)

#define CONN_PIN17_GPIO_PORT  (GPIOG)
#define CONN_PIN17_GPIO_PIN   (GPIO_PIN_1)

#define CONN_PIN18_GPIO_PORT  (GPIOG)
#define CONN_PIN18_GPIO_PIN   (GPIO_PIN_0)

#define CONN_PIN19_GPIO_PORT  (GPIOC)
#define CONN_PIN19_GPIO_PIN   (GPIO_PIN_7)

#define CONN_PIN20_GPIO_PORT  (GPIOC)
#define CONN_PIN20_GPIO_PIN   (GPIO_PIN_6)

#define CONN_PIN21_GPIO_PORT  (GPIOC)
#define CONN_PIN21_GPIO_PIN   (GPIO_PIN_5)

#define CONN_PIN22_GPIO_PORT  (GPIOC)
#define CONN_PIN22_GPIO_PIN   (GPIO_PIN_4)

#define CONN_PIN23_GPIO_PORT  (GPIOC)
#define CONN_PIN23_GPIO_PIN   (GPIO_PIN_3)

#define CONN_PIN24_GPIO_PORT  (GPIOC)
#define CONN_PIN24_GPIO_PIN   (GPIO_PIN_2)

#define CONN_PIN26_GPIO_PORT  (GPIOC)
#define CONN_PIN26_GPIO_PIN   (GPIO_PIN_1)

#define CONN_PIN27_GPIO_PORT  (GPIOA)
#define CONN_PIN27_GPIO_PIN   (GPIO_PIN_3)

#define CONN_PIN28_GPIO_PORT  (GPIOA)
#define CONN_PIN28_GPIO_PIN   (GPIO_PIN_4)

#define CONN_PIN29_GPIO_PORT  (GPIOA)
#define CONN_PIN29_GPIO_PIN   (GPIO_PIN_6)

#define STAMP_GPIO_PORT       (GPIOE)
#define STAMP_GPIO_PIN        (GPIO_PIN_4)

#define BATCH_GPIO_PORT       (GPIOE)
#define BATCH_GPIO_PIN        (GPIO_PIN_3)

#define SW_AUTO_GPIO_PORT     (GPIOE)
#define SW_AUTO_GPIO_PIN      (GPIO_PIN_7)

#define SW_CAM_GPIO_PORT      (GPIOE)
#define SW_CAM_GPIO_PIN       (GPIO_PIN_6)

#define TRIACV_GPIO_PORT      (GPIOF)
#define TRIACV_GPIO_PIN       (GPIO_PIN_0)

#define TRIACS_GPIO_PORT      (GPIOB)
#define TRIACS_GPIO_PIN       (GPIO_PIN_7)

#define TRIACH_GPIO_PORT      (GPIOB)
#define TRIACH_GPIO_PIN       (GPIO_PIN_6)

#define TURR_DIG0_GPIO_PORT   (GPIOF)
#define TURR_DIG0_GPIO_PIN    (GPIO_PIN_4)

#define TURR_DIG1_GPIO_PORT   (GPIOF)
#define TURR_DIG1_GPIO_PIN    (GPIO_PIN_5)

#define TURR_DIG2_GPIO_PORT   (GPIOF)
#define TURR_DIG2_GPIO_PIN    (GPIO_PIN_6)

#define TURR_DIG3_GPIO_PORT   (GPIOF)
#define TURR_DIG3_GPIO_PIN    (GPIO_PIN_7)

#define ROT_DIP0_GPIO_PORT    (GPIOB)
#define ROT_DIP0_GPIO_PIN     (GPIO_PIN_0)

#define ROT_DIP1_GPIO_PORT    (GPIOB)
#define ROT_DIP1_GPIO_PIN     (GPIO_PIN_1)

#define ROT_DIP2_GPIO_PORT    (GPIOB)
#define ROT_DIP2_GPIO_PIN     (GPIO_PIN_2)

#define ROT_DIP3_GPIO_PORT    (GPIOB)
#define ROT_DIP3_GPIO_PIN     (GPIO_PIN_3)

#define DISP_DB_GPIO_PORT     (CONN_PIN3_GPIO_PORT)

#define DISP_DB0_GPIO_PORT    (CONN_PIN3_GPIO_PORT)
#define DISP_DB0_GPIO_PIN     (CONN_PIN3_GPIO_PIN)

#define DISP_DB1_GPIO_PORT    (CONN_PIN4_GPIO_PORT)
#define DISP_DB1_GPIO_PIN     (CONN_PIN4_GPIO_PIN)

#define DISP_DB2_GPIO_PORT    (CONN_PIN5_GPIO_PORT)
#define DISP_DB2_GPIO_PIN     (CONN_PIN5_GPIO_PIN)

#define DISP_DB3_GPIO_PORT    (CONN_PIN6_GPIO_PORT)
#define DISP_DB3_GPIO_PIN     (CONN_PIN6_GPIO_PIN)

#define DISP_DB4_GPIO_PORT    (CONN_PIN7_GPIO_PORT)
#define DISP_DB4_GPIO_PIN     (CONN_PIN7_GPIO_PIN)

#define DISP_DB5_GPIO_PORT    (CONN_PIN8_GPIO_PORT)
#define DISP_DB5_GPIO_PIN     (CONN_PIN8_GPIO_PIN)

#define DISP_DB6_GPIO_PORT    (CONN_PIN9_GPIO_PORT)
#define DISP_DB6_GPIO_PIN     (CONN_PIN9_GPIO_PIN)

#define DISP_DB7_GPIO_PORT    (CONN_PIN10_GPIO_PORT)
#define DISP_DB7_GPIO_PIN     (CONN_PIN10_GPIO_PIN)

#define BUZZER_GPIO_PORT      (CONN_PIN26_GPIO_PORT)
#define BUZZER_GPIO_PIN       (CONN_PIN26_GPIO_PIN)

#define SW_RST_GPIO_PORT      (CONN_PIN23_GPIO_PORT)
#define SW_RST_GPIO_PIN       (CONN_PIN23_GPIO_PIN)

/**
 * @brief Definition for TURRET COM port, connected to USART1
 */ 
#define TURR_COM_TX_GPIO_PORT (GPIOA)
#define TURR_COM_TX_GPIO_PIN  (GPIO_PIN_5)

#define TURR_COM_RX_GPIO_PORT (GPIOA)
#define TURR_COM_RX_GPIO_PIN  (GPIO_PIN_4)


/**
 * @brief Definition for SENSOR port, connected to EXTI
 */ 
#define SENSOR_GPIO_PORT      (GPIOE)
#define SENSOR_GPIO_PIN       (GPIO_PIN_5)
#define SENSOR_EXTI           (EXTI_PORT_GPIOE)
#define SENSOR_EXTI_SENSE     (EXTI_SENSITIVITY_RISE_FALL)

/**
 * @brief Definition for UV port, connected to ADC
 */ 
#define UV_AIN_GPIO_PORT      (GPIOB)
#define UV_AIN_GPIO_PIN       (GPIO_PIN_5)

#define UV_ENB_GPIO_PORT      (GPIOB)
#define UV_ENB_GPIO_PIN       (GPIO_PIN_4)

/**
  * @brief Welcome Message Definition
  */  
#define WELCOME_MSG_SIZE        32
#define WELCOME_MSG_ADDR        0x004000

/**
  * @brief  Writes high level to the specified GPIO pins.
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  PortPins : Specifies the pins to be turned high to the port output.
  *         data register.
  * @retval None
  */
@inline void BSP_SetGPIO(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef Pins)
{
  GPIOx->ODR |= (uint8_t)Pins;
}

/**
  * @brief  Writes low level to the specified GPIO pins.
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  PortPins : Specifies the pins to be turned low to the port output.
  *         data register.
  * @retval None
  */
@inline void BSP_ClrGPIO(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef Pins)
{
  GPIOx->ODR &= (uint8_t)~Pins;
}

/**
  * @brief  Read Cam Switch
  * @param  None
  * @retval True - Cam Switch Pressed
  */
#define BSP_ReadCamSwitch() \
  ((SW_CAM_GPIO_PORT->IDR & SW_CAM_GPIO_PIN) ? \
   (FALSE) : (TRUE));

/**
  * @brief  Read Auto Switch
  * @param  None
  * @retval True - Auto Switch Pressed
  */
#define BSP_ReadAutoSwitch() \
  ((SW_AUTO_GPIO_PORT->IDR & SW_AUTO_GPIO_PIN) ? \
   (FALSE) : (TRUE));

/**
  * @brief  H-Motor Enable / Disable
  * @param  state - True (Enable) / False (Disable)
  * @retval None
  */
@inline void BSP_H_MotorEnable(uint8_t state)
{
  if(state == TRUE)
    BSP_ClrGPIO(TRIACH_GPIO_PORT, TRIACH_GPIO_PIN);
  else
    BSP_SetGPIO(TRIACH_GPIO_PORT, TRIACH_GPIO_PIN);
}

/**
  * @brief  S-Motor Enable / Disable
  * @param  state - True (Enable) / False (Disable)
  * @retval None
  */
@inline void BSP_S_MotorEnable(uint8_t state)
{
  if(state == TRUE)
    BSP_ClrGPIO(TRIACS_GPIO_PORT, TRIACS_GPIO_PIN);
  else
    BSP_SetGPIO(TRIACS_GPIO_PORT, TRIACS_GPIO_PIN);
}

/**
  * @brief  V-Pump Enable / Disable
  * @param  state - True (Enable) / False (Disable)
  * @retval None
  */
@inline void BSP_V_PumpEnable(uint8_t state)
{
  if(state == TRUE)
    BSP_ClrGPIO(TRIACV_GPIO_PORT, TRIACV_GPIO_PIN);
  else
    BSP_SetGPIO(TRIACV_GPIO_PORT, TRIACV_GPIO_PIN);
}

/**
  * @brief  B-Coil Enable / Disable
  * @param  state - True (Enable) / False (Disable)
  * @retval None
  */
@inline void BSP_B_CoilEnable(uint8_t state)
{
  if(state == TRUE)
    BSP_ClrGPIO(BATCH_GPIO_PORT, BATCH_GPIO_PIN);
  else
    BSP_SetGPIO(BATCH_GPIO_PORT, BATCH_GPIO_PIN);
}

/**
  * @brief  S-Coil Enable / Disable
  * @param  state - True (Enable) / False (Disable)
  * @retval None
  */
@inline void BSP_S_CoilEnable(uint8_t state)
{
  if(state == TRUE)
    BSP_ClrGPIO(STAMP_GPIO_PORT, STAMP_GPIO_PIN);
  else
    BSP_SetGPIO(STAMP_GPIO_PORT, STAMP_GPIO_PIN);
}

/**
  * @brief  UV LED Enable / Disable
  * @param  state - True (Enable) / False (Disable)
  * @retval None
  */
@inline void BSP_UV_DetectEnable(uint8_t state)
{
  if(state == TRUE)
    BSP_ClrGPIO(UV_ENB_GPIO_PORT, UV_ENB_GPIO_PIN);
  else
    BSP_SetGPIO(UV_ENB_GPIO_PORT, UV_ENB_GPIO_PIN);
}

/**
  * @brief  S-Fan Enable / Disable
  * @param  state - True (Enable) / False (Disable)
  * @retval None
  */
@inline void BSP_S_FanEnable(uint8_t state)
{
  if(state == TRUE)
    BSP_ClrGPIO(STAMP_GPIO_PORT, STAMP_GPIO_PIN);
  else
    BSP_SetGPIO(STAMP_GPIO_PORT, STAMP_GPIO_PIN);
}
  
extern uint32_t BuzzerOnTime;
extern uint16_t AdcValue;
extern __IO uint32_t SystemTimer;
extern __IO uint32_t BspSensorCounter;

/**
  * @brief  Returns the SystemTimer variable.
  * @param  None
  * @retval System Timer Variable
  */
@inline uint32_t BSP_GetSysTime(void)
{
  return SystemTimer;
}

/**
  * @brief  Enables Buzzer
  * @param  buzzTime - Time for which the buzzer remains ON
  * @retval None
  */
@inline void BSP_EnableBuzzer(uint32_t buzzTime)
{
  BuzzerOnTime = buzzTime;
}

/**
  * @brief  Disables Buzzer
  * @param  None
  * @retval None
  */
@inline void BSP_DisableBuzzer(void)
{
  BuzzerOnTime = 0;
}

/**
  * @brief  Returns ADC Value
  * @param  None
  * @retval None
  */
@inline uint16_t BSP_GetADC(void)
{
  return AdcValue;
}

void BSP_Init(void);
void BSP_DelayMs(uint16_t delay);
void BSP_BuzzerExec(void);
void BSP_AdcExec(void);
uint8_t BSP_ReadRotDipSwitch(void);
void BSP_ReadFromFlash(uint16_t size, uint8_t *pData);
void BSP_WriteToFlash(uint16_t size, uint8_t *pData);

#include "main.h"
#include "disp.h"
#include "key.h"
#include "switch.h"
#include "turret.h"

#endif /* __BSP_H */

/***********************END OF FILE************************/
