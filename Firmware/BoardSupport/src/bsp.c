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

/* Private typedef -----------------------------------------------------------*/
/* Private constants----------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t  BuzzerEnable = FALSE;
uint32_t BuzzerOnTime = 0;
__IO uint16_t AdcValue = 0;
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
             UART1_MODE_TX_ENABLE);

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
  ADC2_Init(ADC2_CONVERSIONMODE_CONTINUOUS, ADC2_CHANNEL_5, ADC2_PRESSEL_FCPU_D18, \
            ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL5, \
            DISABLE);
  /* Enable EOC interrupt */
  ADC2_ITConfig(ENABLE);

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
  AdcValue = (AdcValue >> 1) + (adcVal >> 1);
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
  * @brief  Configures the IWDG to generate a Reset if it is not refreshed at the
  *         correct time. 
  * @param  None
  * @retval None
  */
void BSP_WatchdogConfig(void)
{
  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable();
  
  /* IWDG timeout equal to 250 ms (the timeout may varies due to LSI frequency
     dispersion) */
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  
  /* IWDG counter clock: LSI/256 */
  IWDG_SetPrescaler(IWDG_Prescaler_256);
  
  /*  
    Independent Watchdog Prescaler – IWDG_PR and Independent Watchdog Reload Register – IWDG_RLR
    These two registers define the watchdog window and can. 
    The default values are IWDG_PR = 0 and IWDG_RLR = 0xff. 
    This gives a watchdog window of approximately 16ms. 
    To change the size of the watchdog window use the table 
    below to determine the values which are appropriate for your application:
    
    Prescaler Divider  Prescaler Value (IWDG_PR)  Period when RL = 0  Period when RL = 0xff
    4  0  62.5 us  15.90 ms
    8  1  125 us  31.90 ms
    16  2  250 us  63.70 ms
    32  3  500 us  127 ms
    64  4  1.00 ms  255 ms
    128  5  2.00 ms  510 ms
    256  6  4.00 ms  1.02 s
    The programming reference for the STM8S gives the 
    following formula for determining the exact reset period:
    
    T = 2 x TLSI x P x R
    
    where:
    
    T  Timeout period
    TLSI  1 / fLSI
    P  2(IWDG_PR + 2)
    R  IWDG_RLR + 1
    Additionally, the time between the last reset of the 
    key register (i.e. writing 0xAA to IWDG_KR) is T + 6 x TLSI.
  */
  IWDG_SetReload((uint8_t)0xFF);
  
  /* Reload IWDG counter */
  IWDG_ReloadCounter();
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
