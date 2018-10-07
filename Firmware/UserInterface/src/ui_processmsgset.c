/**
  ******************************************************************************
  * @file    ui_processmsgset.c
  * @author  Vipul Panchal
  * @brief   This file contains ui Message Setting process function
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ui.h"

/* Private typedef -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private constants----------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
static const char CharacterList[] = 
{
  ' ', 
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
  '-', '.'
};

static uint8_t GetCharIndex(char character)
{
  uint8_t index = sizeof(CharacterList);

  do
  {
    index--;
  } while((character != CharacterList[index]) && (index > 0));
  
  return index;
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Process Function for Editing Welcome Message
  * @param  pParam - Pointer to the any parameters
  * @param  pMsg - Pointer to the ui message
  * @retval status of the process (continue or Finish)
  */
uint8_t UI_ProcessMsgSet(void *pParam, UI_MSG_T *pMsg)
{
#define CURSOR_BLINK_TIME   (500)

  const char * pStrWelcomeMsg = (char *)WELCOME_MSG_ADDR;
  static uint8_t MsgCursorPos = 0;
  static uint8_t CursorCharIdx = 0;
  static uint8_t NewMessageEntry = 0;
  static uint8_t NewMessageStart = 0;
  uint8_t dispCursorPos, dispStartPos;
  uint8_t clearMsgBuff = FALSE;
  static uint8_t cursorBlinkOn = FALSE;
  static char welcomemsg[WELCOME_MSG_SIZE];

  switch(pMsg->message)
  {
    case UIMSG_INIT:
    {
      /* Copy the string locally from flash memory */
      memset(&welcomemsg[0], 0x00, WELCOME_MSG_SIZE);
      strncpy(&welcomemsg[0], pStrWelcomeMsg, WELCOME_MSG_SIZE);
      MsgCursorPos = 0;
      CursorCharIdx = 0;//GetCharIndex(welcomemsg[MsgCursorPos]);
      NewMessageEntry = FALSE;
      NewMessageStart = FALSE;
      cursorBlinkOn = FALSE;
    }
    break;

  /* Up Scrolls the current character from the list */
    case UIMSG_KEY_UP:
    case UIMSG_KEY_NEXT:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        NewMessageEntry = TRUE;
        clearMsgBuff = (uint8_t)((NewMessageStart == TRUE) ? FALSE : TRUE);
        CursorCharIdx = (uint8_t)(((CursorCharIdx + 1) >= sizeof(CharacterList)) ?
                                     0 : (CursorCharIdx + 1)); 
        welcomemsg[MsgCursorPos] = CharacterList[CursorCharIdx];
        cursorBlinkOn = FALSE;
      }
    break;

  /* Down Scrolls the current character from the list */
    case UIMSG_KEY_DOWN:
    case UIMSG_KEY_BACK:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        NewMessageEntry = TRUE;
        clearMsgBuff = (uint8_t)((NewMessageStart == TRUE) ? FALSE : TRUE);
        CursorCharIdx = (uint8_t)((CursorCharIdx == 0) ? 
                          (sizeof(CharacterList) - 1) : (CursorCharIdx - 1)); 
        welcomemsg[MsgCursorPos] = CharacterList[CursorCharIdx];
        cursorBlinkOn = FALSE;
      }
    break;
    
  /* Moves MsgCursorPos forward */
    case UIMSG_KEY_ENT:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        NewMessageEntry = TRUE;
        clearMsgBuff = (uint8_t)((NewMessageStart == TRUE) ? FALSE : TRUE);
        MsgCursorPos = (uint8_t)(((MsgCursorPos + 1) >= WELCOME_MSG_SIZE) ?
                          0 : (MsgCursorPos + 1)); 
        CursorCharIdx = 0;//GetCharIndex(welcomemsg[MsgCursorPos]);
        cursorBlinkOn = FALSE;
      }
    break;
    
  /* Moves MsgCursorPos backward */
    case UIMSG_KEY_MODE:
    case UIMSG_KEY_FUNC:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        NewMessageEntry = TRUE;
        clearMsgBuff = (uint8_t)((NewMessageStart == TRUE) ? FALSE : TRUE);
        MsgCursorPos = (uint8_t)((MsgCursorPos == 0) ? 
                        (WELCOME_MSG_SIZE - 1) : (MsgCursorPos - 1)); 
        CursorCharIdx = GetCharIndex(welcomemsg[MsgCursorPos]);
        cursorBlinkOn = FALSE;
      }
    break;

    case UIMSG_KEY_CLR:
    case UIMSG_SW_RESET:
      if((uint8_t)pMsg->param == UI_PRESS)
      {
        if(NewMessageEntry == TRUE)
        {
          uint8_t cnt;
         
          for(cnt = 0; cnt < (WELCOME_MSG_SIZE / 4); cnt++)
          {
            uint32_t *pWord = (uint32_t *)&welcomemsg[cnt * 4];
            
            FLASH_Unlock(FLASH_MEMTYPE_DATA);
            FLASH_ProgramWord(WELCOME_MSG_ADDR + (cnt * 4), *pWord);
            FLASH_Lock(FLASH_MEMTYPE_DATA);
          }
        }
        return UI_RC_FINISH;
      }
    break;

    default:
    break;
  }
  
  if((NewMessageEntry == TRUE) && (clearMsgBuff == TRUE))
  {
    memset(&welcomemsg[0], 0x00, WELCOME_MSG_SIZE);
    MsgCursorPos = 0;
    NewMessageStart = TRUE;
  }
  
  /* Handle display */
  /* Clear all Display */
  DISP_ClearAll();

  /* Calculate the display MsgCursorPos position w.r.t message MsgCursorPos position and display size */
  dispCursorPos = (uint8_t)((MsgCursorPos > (DISP_UPPER_MAX_NB - 1)) ? 
                            (DISP_UPPER_MAX_NB - 1) : MsgCursorPos);
  /* Calculate the message start position based on display MsgCursorPos and message MsgCursorPos */
  dispStartPos = (uint8_t)(MsgCursorPos - dispCursorPos);
  
  /* Put the Welcome Message on Upper Display */
  DISP_UpperPutStr((char *)&welcomemsg[dispStartPos], 0);
  
  /* Check if Cursor to be blanked out */
  if(cursorBlinkOn == FALSE)
  {
    DISP_UpperPutChar(' ', dispCursorPos);
  }
  
  /* Toggle Cursor Blinking */
  cursorBlinkOn = (uint8_t)((cursorBlinkOn == FALSE) ? TRUE : FALSE);

  UI_SetRefreshMsg(CURSOR_BLINK_TIME);
  
  return UI_RC_CONTINUE;

#undef CURSOR_BLINK_TIME
}
/**********************************END OF FILE*********************************/
