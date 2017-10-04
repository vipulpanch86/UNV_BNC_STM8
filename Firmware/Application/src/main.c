/**
  ******************************************************************************
  * @file    main.c
  * @author  Vipul Panchal
  * @brief   This file contains the main function for Currency counting
  *          application.
  ******************************************************************************
  */

/* Pending ISR for System timer, Sensor & Turret */
/* Includes ------------------------------------------------------------------*/
#include "bsp.h"
#include "ui.h"

/* Private typedef -----------------------------------------------------------*/
#define DISP_EXEC_MS (1)
#define KPD_SCAN_MS  (1)
#define BUZZ_EXEC_MS (100)
#define RET_EXEC_MS  (1)
#define SNR_EXEC_MS  (1)
#define UI_EXEC_MS   (10)

#define STUB_ROT_DIP_SW
#define ROT_DIP_SW  (1)

/* Private define ------------------------------------------------------------*/
#ifdef _RAISONANCE_
#define PUTCHAR_PROTOTYPE int putchar (char c)
#define GETCHAR_PROTOTYPE int getchar (void)
#elif defined (_COSMIC_)
#define PUTCHAR_PROTOTYPE char putchar (char c)
#define GETCHAR_PROTOTYPE char getchar (void)
#else /* _IAR_ */
#define PUTCHAR_PROTOTYPE int putchar (int c)
#define GETCHAR_PROTOTYPE int getchar (void)
#endif /* _RAISONANCE_ */

#define SENSOR_EXEC_WAIT_COUNTING_EN  (0)
#define SENSOR_EXEC_EXECUTE_COUNTING  (1)
#define WAIT_FOR_SENSOR_DISABLE_MS    (50)

#define DIP_SW_MAX_POS                (16)

/* Private typedef -----------------------------------------------------------*/
typedef struct
{
  uint8_t dispIndex;
  uint8_t kpdIndex;
  uint8_t valueEnable;
  
}DISP_KPD_TYPE_T;

typedef enum 
{
  DISP_T16X5B8X4__KPD_18_3X7,
  DISP_T16X7B8X4__KPD_26_7X4,
  DISP_KPD_TYPE_MAX
} DISP_KPD_BOARD_INDEX_T;
  
/* Private constants ---------------------------------------------------------*/
  
static const DISP_KPD_TYPE_T DISP_KPD_TYPE_MAP[DIP_SW_MAX_POS] = 
{
  [DISP_T16X5B8X4__KPD_18_3X7] = 
    {
      .dispIndex   = DISP_TYPE_T16X5B8X4, 
      .kpdIndex    = KPD_TYPE_18_3X7,
      .valueEnable = TRUE
    },
  [DISP_T16X7B8X4__KPD_26_7X4] = 
    {
      .dispIndex   = DISP_TYPE_T16X7B8X4, 
      .kpdIndex    = KPD_TYPE_26_7X4,
      .valueEnable = TRUE
    },
};

/* Private variables ---------------------------------------------------------*/
uint8_t  FlagValueCount = FALSE;
uint8_t  FlagAutoCount = TRUE;
uint8_t  FlagAddCount = 0;
uint8_t  FlagUvDetect = 0;
uint8_t  FlagSensorEn = 0;
uint8_t  CounterMode = COUNT_MODE_C;
uint32_t SensorCounter = 0;

static uint8_t SensorExecState = SENSOR_EXEC_WAIT_COUNTING_EN;
static uint8_t UvDetected = FALSE;
static uint32_t BkupSensorCounter = 0;
static uint8_t WaitLastNoteCount = 0;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Sensor Scan Execution.
  * @param  None
  * @retval None
  */
@inline void SENSOR_Exec(void)
{
  extern __IO uint32_t BspSensorCounter;
  
  if(SensorExecState == SENSOR_EXEC_WAIT_COUNTING_EN)
  {
    
    SensorExecState = (uint8_t)((FlagSensorEn == TRUE)?
                        (SENSOR_EXEC_EXECUTE_COUNTING):
                        (SensorExecState));
    if(FlagSensorEn == TRUE)
    {
      uint32_t stampEnable = 0;
      REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
          
      SensorExecState = SENSOR_EXEC_EXECUTE_COUNTING;
      WaitLastNoteCount = WAIT_FOR_SENSOR_DISABLE_MS;
      BspSensorCounter = 0;
      UvDetected = FALSE;
      
      if(stampEnable == FALSE)
      {
        BSP_S_FanEnable(TRUE);
      }
    }
  }
  else
  {
    uint32_t bspSensorCounter = (BspSensorCounter >> 1) + (BspSensorCounter & 0x1);
    
    WaitLastNoteCount = (uint8_t)((WaitLastNoteCount > 0) ? (WaitLastNoteCount - 1) : 0);
    if(bspSensorCounter != BkupSensorCounter)
    {
      UI_MSG_T msg = {0, UIMSG_COUNTER};
  
      SensorCounter += (bspSensorCounter - BkupSensorCounter);
      BkupSensorCounter = bspSensorCounter;
      
      WaitLastNoteCount = WAIT_FOR_SENSOR_DISABLE_MS;
      UI_PostMessage(&msg);
    }
    /* Execute UV Detection */
    if((FlagUvDetect == TRUE) && (UvDetected == FALSE))
    {
      uint16_t adcValue = BSP_GetADC();
      uint32_t uvThresValue = 0;
      REG_GetValue(&uvThresValue, REG_ID_UV_LVL);
  
      if(adcValue > uvThresValue)
      {
        UI_MSG_T msg = {0, UIMSG_UVDETECT};
        
        UvDetected = TRUE;
  
        /* Post Message to stop Counting */
        UI_PostMessage(&msg);
      }
    }
    
    if((FlagSensorEn == FALSE) && (WaitLastNoteCount == 0))
    {
      uint32_t stampEnable = 0;
      REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);

      SensorExecState = SENSOR_EXEC_WAIT_COUNTING_EN;
      BkupSensorCounter = 0;
      UvDetected = FALSE;
      
      if(stampEnable == FALSE)
      {
        BSP_S_FanEnable(FALSE);
      }
    }
  }
}

/**
  * @brief  Display and Keypad Initialization based on the DIP switch position.
  * @param  None
  * @retval None
  */
void DisplayKeypadInit(void) 
{
  #ifdef STUB_ROT_DIP_SW
  uint8_t rotDipSwitchPos = ROT_DIP_SW;
  #else
  uint8_t rotDipSwitchPos = BSP_ReadRotDipSwitch();
  #endif
	
  printf("\n\rDip = %u", (uint32_t)rotDipSwitchPos);
  rotDipSwitchPos = (rotDipSwitchPos >= DISP_KPD_TYPE_MAX) ? 
	                (DISP_KPD_TYPE_MAX - 1) : (rotDipSwitchPos);
  
  FlagValueCount = DISP_KPD_TYPE_MAP[rotDipSwitchPos].valueEnable;
  DISP_Init(DISP_KPD_TYPE_MAP[rotDipSwitchPos].dispIndex);
  KPD_Init(DISP_KPD_TYPE_MAP[rotDipSwitchPos].kpdIndex, 20, UI_KeyCallBack);
}

/**
  * @brief  Absolute value calculation.
  * @param  None
  * @retval None
  */
int32_t absolute(int32_t value) 
{
  if (value < 0) 
	{
    return -value;
  }
  else 
	{
    return value;  
  }
}
#if 1
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
  uint32_t swVersion = 0;

  /* BSP Initialization -----------------------------------------*/
  BSP_Init();
  
	BSP_DelayMs(1500);
  /* Initialize the I2C EEPROM driver ----------------------------------------*/
  //EE_Init();  
  
  /* Initialize Display & Keypad */
  DisplayKeypadInit();
  TURR_Clear();

  /* Initialize Switches */
  SW_Init(20, UI_SwCallBack);
  
  RET_Init();
  REG_Init(FALSE);
  REG_GetValue(&swVersion, REG_ID_SW_VERSION);

  if(swVersion != BSP_SW_VERSION)
  {
    REG_Init(TRUE);
    RET_UpdateFlash();
  }

  UI_Init();

  while(1)
  {
    static uint32_t BkupDispExecTime = 0;
    static uint32_t BkupKpdScanTime = 0;
//    static uint32_t BkupTurrExecTime = 0;
    static uint32_t BkupBuzzExecTime = 0;
    static uint32_t BkupRetExecTime = 0;
    static uint32_t BkupSnrExecTime = 0;
    static uint32_t BkupUiExecTime = 0;
    
    uint32_t sysTime = BSP_GetSysTime();
    
    if((sysTime - BkupDispExecTime) >= DISP_EXEC_MS)
    {
      BkupDispExecTime = sysTime;
      DISP_Exec();
    }
    
    if((sysTime - BkupKpdScanTime) >= KPD_SCAN_MS)
    {
      BkupKpdScanTime = sysTime;
      KPD_Scan();
      SW_Scan();
    }

    if(TURR_GetNewDataFlag())
    {
      TURR_Exec();
    }
  
    if((sysTime - BkupBuzzExecTime) >= BUZZ_EXEC_MS)
    {
      BkupBuzzExecTime = sysTime;
      BSP_BuzzerExec();
    }
  
    if(ADC2_GetFlagStatus())
    {
      BSP_AdcExec();
    }

    if((sysTime - BkupRetExecTime) >= RET_EXEC_MS)
    {
      BkupRetExecTime = sysTime;
      RET_Exec();
    }
    
    if((sysTime - BkupSnrExecTime) >= SNR_EXEC_MS)
    {
      BkupSnrExecTime = sysTime;
      SENSOR_Exec();
    }

    if((sysTime - BkupUiExecTime) >= UI_EXEC_MS)
    {
      BkupUiExecTime = sysTime;
      UI_Exec();
    }
    
    if(UI_GetNbOfMsgUnProcessed())
    {
      UI_ProcessMsg();
    }
  }
}
#endif
#if 0
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
int main(void)
{
	extern void switch_test(void);
  switch_test();
}
#endif
#if 0
int main (void)
{
	char ans;
		
  CLK_DeInit();

  /* Configure the Fcpu to DIV1*/
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  
  /* Configure the HSI prescaler to the optimal value */
  CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);

  /* Configure the system clock to use HSE clock source and to run at 24Mhz */
  CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE,
                        CLK_CURRENTCLOCKSTATE_DISABLE);
  
	GPIO_Init(GPIOE, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
	
  UART1_DeInit();
  /* UART1 configuration ------------------------------------------------------*/
  /* UART1 configured as follow:
        - BaudRate = 115200 baud  
        - Word Length = 8 Bits
        - One Stop Bit
        - No parity
        - Receive and transmit enabled
        - UART1 Clock disabled
  */
  UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
              UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);

  /* Output a message on Hyperterminal using printf function */
  printf("\n\rEnter Text\n\r");

  while (1)
  {
		volatile int PortE_7;
		
    ans = getchar();
		PortE_7 = GPIOE->IDR & 0x80;
    printf("\n\rPort_E7 %d", PortE_7);  
  }	
}
#endif
/**
  * @brief Retargets the C library printf function to the UART.
  * @param c Character to send
  * @retval char Character sent
  */
PUTCHAR_PROTOTYPE
{
  /* Write a character to the UART1 */
  UART1_SendData8(c);
  /* Loop until the end of transmission */
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

  return (c);
}

/**
  * @brief Retargets the C library scanf function to the USART.
  * @param None
  * @retval char Character to Read
  */
GETCHAR_PROTOTYPE
{
#ifdef _COSMIC_
  char c = 0;
#else
  int c = 0;
#endif
  /* Loop until the Read data register flag is SET */
  while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
    c = UART1_ReceiveData8();
  return (c);
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
