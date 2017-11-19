/**
  ******************************************************************************
  * @file    bsp.c
  * @author  Vipul Panchal
  * @brief   This file contains the board related functions
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"

/* Private define ------------------------------------------------------------*/
#define CPU_CLOCK_SPEED   24000000ul
#define TIM4_PERIOD       187
#define DATA_START_ADDR   0x004080
#define RET_MEM_FLASH
/* Private typedef -----------------------------------------------------------*/
/* Private constants----------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t  BuzzerEnable = FALSE;
uint32_t BuzzerOnTime = 0;
uint16_t AdcValue = 0;
__IO uint32_t SystemTimer = 0;
__IO uint32_t BspSensorCounter = 0;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Configure system clock to run at 16Mhz
  * @param  None
  * @retval None
  */
static void CLK_Config(void)
{
  CLK_DeInit();

  /* Configure the Fcpu to DIV1*/
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  
  /* Configure the HSI prescaler to the optimal value */
  CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);

  /* Configure the system clock to use HSE clock source and to run at 24Mhz */
  CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE,
                        CLK_CURRENTCLOCKSTATE_DISABLE);
}

/**
  * @brief  Configure GPIO for LEDs available on the evaluation board
  * @param  None
  * @retval None
  */
static void GPIO_Config(void)
{
  /* Configure the TRIAC Control Pin for Vaccum Pump
     Default State is High
  */
  GPIO_Init(TRIACV_GPIO_PORT, TRIACV_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  /* Configure the TRIAC Control Pin for Spindle Motor
     Default State is High
  */
  GPIO_Init(TRIACS_GPIO_PORT, TRIACS_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  /* Configure the TRIAC Control Pin for Hopper Motor
     Default State is High
  */
  GPIO_Init(TRIACH_GPIO_PORT, TRIACH_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  /* Configure the Batch Coil Control Pin as Output
     Default State is High
  */
  GPIO_Init(BATCH_GPIO_PORT, BATCH_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  /* Configure the Stamp Coil Control Pin as Output
     Default State is High
  */
  GPIO_Init(STAMP_GPIO_PORT, STAMP_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  /* Configure the Buzzer Enable Pin as Output
     Default State is Low
  */
  GPIO_Init(BUZZER_GPIO_PORT, BUZZER_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);

  /* Configure the Reset Key as Input & Pull-up
  */
  GPIO_Init(SW_RST_GPIO_PORT, SW_RST_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Hopper Switch as Input & Pull-up
  */
  GPIO_Init(SW_CAM_GPIO_PORT, SW_CAM_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Auto Switch as Input & Pull-up
  */
  GPIO_Init(SW_AUTO_GPIO_PORT, SW_AUTO_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Rotary DIP Switch Bit0 as Input & Pull-up
  */
  GPIO_Init(ROT_DIP0_GPIO_PORT, ROT_DIP0_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Rotary DIP Switch Bit1 as Input & Pull-up
  */
  GPIO_Init(ROT_DIP1_GPIO_PORT, ROT_DIP1_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Rotary DIP Switch Bit2 as Input & Pull-up
  */
  GPIO_Init(ROT_DIP2_GPIO_PORT, ROT_DIP2_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /* Configure the Rotary DIP Switch Bit3 as Input & Pull-up
  */
  GPIO_Init(ROT_DIP3_GPIO_PORT, ROT_DIP3_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

/**
  * @brief  Configures Sensor GPIO and EXTI Line.
  * @param  None
  * @retval None
  */
void SENSOR_Config(void)
{
  /* Configure Sensor pin as input */
  GPIO_Init(SENSOR_GPIO_PORT, SENSOR_GPIO_PIN, GPIO_MODE_IN_FL_IT);
  /* Connect Sensor EXTI Line to Sensor GPIO Pin */
  EXTI_SetExtIntSensitivity(SENSOR_EXTI, SENSOR_EXTI_SENSE);

}
/**
  * @brief  Configure the FLASH for block programming
  * @param  None
  * @retval None
  */
void FLASH_Config(void)
{
  FLASH_DeInit();
  
  /* Define flash programming Time*/
  FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
}

/**
  * @brief  Configure TIM4 to generate an update interrupt each 1ms
  * @param  None
  * @retval None
  */
static void TIM4_Config(void)
{
  /* TIM4 configuration:
   - TIM4CLK is set to 24 MHz, the TIM4 Prescaler is equal to 128 so the
     TIM1 counter clock used is 24 MHz / 128 = 187500 Hz
   - With 187500 Hz we can generate time base:
      max time base is 1.365 ms if TIM4_PERIOD = 255 -> (255 + 1) / 187500 = 1.365 ms
      min time base is 0.001 ms if TIM4_PERIOD = 1   -> (  1 + 1) / 187500 = 0.001 ms
  -  In this example we need to generate a time base equal to 1 ms
     so TIM4_PERIOD = (0.001 * 187500 - 1) = 187 */

  /* Time base configuration */
  TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
  /* Clear TIM4 update flag */
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  /* Enable update interrupt */
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  /* Enable TIM4 */
  TIM4_Cmd(ENABLE);
}

/**
  * @brief  Configure UART1 for the communication with Turret
  * @param  None
  * @retval None
  */
static void UART1_Config(void)
{
  /* Deinitializes the UART1 peripheral */
  UART1_DeInit();

  /* UART1 configuration -------------------------------------------------*/
  /* UART configured as follow:
        - BaudRate = 9600 baud
        - Word Length = 8 Bits
        - One Stop Bit
        - No parity
        - Receive and transmit enabled
        - UART Clock disabled
  */

  UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1,
             UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE,
             UART1_MODE_TXRX_ENABLE);

  /* Enable UART */
  UART1_Cmd(ENABLE);
}

/**
  * @brief  UV Configuration
  * @param  None
  * @retval None
  */
static void UV_Config(void)
{
  /* Configure the UV Enable as Output
     Default State is High (UV Disable)
  */
  GPIO_Init(UV_ENB_GPIO_PORT, UV_ENB_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);

   /* Configure ADC Channel5 (PB5) as analog input */
  GPIO_Init(UV_AIN_GPIO_PORT, UV_AIN_GPIO_PIN, GPIO_MODE_IN_FL_NO_IT);
  /* De-Init ADC peripheral*/
  ADC2_DeInit();

  /* Init ADC2 peripheral */
  ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_5, ADC2_PRESSEL_FCPU_D18, \
            ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL5, \
            DISABLE);

  /* Start ADC2 Conversion */
  ADC2_StartConversion();
}

/**
  * @brief  Executes Buzzer
  * @param  None
  * @retval None
  */
void BSP_BuzzerExec(void)
{
  static uint32_t BackupSysTime = 0;

  if(BuzzerEnable == TRUE)
  {
    if(labs((int32_t)(SystemTimer - BackupSysTime)) >= BuzzerOnTime)
    {
      BuzzerEnable = FALSE;
      BuzzerOnTime = 0;
      BackupSysTime = 0;

      BSP_ClrGPIO(BUZZER_GPIO_PORT, BUZZER_GPIO_PIN);
    }
  }
  else
  {
    if(BuzzerOnTime > 0)
    {
      BuzzerEnable = TRUE;
      BackupSysTime = SystemTimer;
      
      BSP_SetGPIO(BUZZER_GPIO_PORT, BUZZER_GPIO_PIN);
    }
  }
}

/**
  * @brief  Executes ADC
  * @param  None
  * @retval None
  */
void BSP_AdcExec(void)
{
  uint16_t adcVal;

  ADC2_ClearFlag();
  adcVal = ADC2_GetConversionValue();
  ADC2_StartConversion();
  AdcValue = (AdcValue >> 1) + (AdcValue >> 2) + (adcVal >> 2);
}

/**
  * @brief  DeInitializes peripherals used by the I2C EEPROM driver.
  * @param  None
  * @retval None
  */
void BSP_EepromDeInit(void)
{
  /* EE_I2C Peripheral Disable */
  I2C_Cmd(DISABLE);

  /* EE_I2C DeInit */
  I2C_DeInit();

  /*!< EE_I2C Peripheral clock disable */
  CLK_PeripheralClockConfig(EE_I2C_CLK, DISABLE);

  /*!< GPIO configuration */
  /*!< Configure EE_I2C pins: SCL */
  GPIO_Init(EE_I2C_SCL_GPIO_PORT, EE_I2C_SCL_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);

  /*!< Configure EE_I2C pins: SDA */
  GPIO_Init(EE_I2C_SDA_GPIO_PORT, EE_I2C_SDA_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

/**
  * @brief  Initializes peripherals used by the I2C EEPROM driver.
  * @param  None
  * @retval None
  */
void BSP_EepromInit(void)
{
  /*!< Configure EE_I2C pins: SCL */
  GPIO_Init(EE_I2C_SCL_GPIO_PORT, EE_I2C_SCL_GPIO_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);

  /*!< Configure EE_I2C pins: SDA */
  GPIO_Init(EE_I2C_SDA_GPIO_PORT, EE_I2C_SDA_GPIO_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);  
  
  /*!< Configure EE_WP pin: WP */
  GPIO_Init(EE_I2C_WP_GPIO_PORT, EE_I2C_WP_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  
   /*!< EE_I2C Peripheral clock enable */
  CLK_PeripheralClockConfig(EE_I2C_CLK, ENABLE);

}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Initialzation Board for Functionallity
  * @param  None
  * @retval None
  */
void BSP_Init(void)
{
  /* GPIO configuration */
  GPIO_Config();

  /* Sensor COnfiguration */
  SENSOR_Config();
  
  /* Flash configuration */
  FLASH_Config();

  /* Clock configuration */
  CLK_Config();

  /* TIM4 configuration */
  TIM4_Config();

  /* UART1 configuration */
  UART1_Config();

  /* ADC configuration */
  UV_Config();

  /* Enable general interrupts */
  enableInterrupts();
}

/**
  * @brief  Inserts Delay in Milliseconds
  * @param  Value in Milliseconds to crreate delay
  * @retval None
  */
void BSP_DelayMs(uint16_t delay)
{
  uint32_t backupSysTmr = SystemTimer;
  
  while(labs(SystemTimer - backupSysTmr) < delay);
}
/**
  * @brief  Reads Rotary DIP switch
  * @param  None
  * @retval Returns DIP switch value 0 - 15
  */
uint8_t BSP_ReadRotDipSwitch(void)
{
  uint8_t dipSwitchVal = 0;
  
  /* Switches are active low */
  dipSwitchVal |= (uint8_t)((ROT_DIP0_GPIO_PORT->IDR & ROT_DIP0_GPIO_PIN) ? 0: 1<<0);
  dipSwitchVal |= (uint8_t)((ROT_DIP1_GPIO_PORT->IDR & ROT_DIP1_GPIO_PIN) ? 0: 1<<1);
  dipSwitchVal |= (uint8_t)((ROT_DIP2_GPIO_PORT->IDR & ROT_DIP2_GPIO_PIN) ? 0: 1<<2);
  dipSwitchVal |= (uint8_t)((ROT_DIP3_GPIO_PORT->IDR & ROT_DIP3_GPIO_PIN) ? 0: 1<<3);
  
  return (dipSwitchVal) ;
}
/**
  * @brief  Reads from Flash
  * @param  size - No of bytes to be read
  * @param  pData - Pointer to the Buffer where data needs to be read
  * @retval None
  */
void BSP_ReadFromFlash(uint16_t size, uint8_t *pData)
{
  uint16_t cnt;

  for(cnt = 0; cnt < size; cnt++)
  {
    pData[cnt] = FLASH_ReadByte(DATA_START_ADDR + cnt);
  }
}

/**
  * @brief  Writes to Flash
  * @param  size - No of bytes to be Written
  * @param  pData - Pointer to the Buffer from where data needs to be written
  * @retval None
  */
void BSP_WriteToFlash(uint16_t size, uint8_t *pData)
{
  uint16_t cnt;

  FLASH_Unlock(FLASH_MEMTYPE_DATA);

  while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);

  for(cnt = 0; cnt < size; cnt++)
  {
    FLASH_EraseByte(DATA_START_ADDR + cnt);
    FLASH_ProgramByte(DATA_START_ADDR + cnt, pData[cnt]);
  }

  FLASH_Lock(FLASH_MEMTYPE_DATA);
}
/***********************END OF FILE************************/
