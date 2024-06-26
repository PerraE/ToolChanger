/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "app.h"

#define TURRET_FORWARD_DIR  	GPIO_PIN_RESET	// Direction
#define TURRET_REVERSE_DIR 		GPIO_PIN_SET
#define TURRET_FORWARD_POWER  	2000		// Max power = 2000.
#define TURRET_REVERSE_POWER 	700			// Selected lock power = 50% of max
#define TURRET_LOCK_POWER 		150			// Selected lock power = 5% of max
#define LOCKTHRESHOLD			3000		// Threshold current while reverse to find lock position
#define false 0
#define true 1

typedef enum
{
  IDLE = 0,
  FORWARD,
  REVERSE,
  LOCK,
  WAIT
}_Turret_State;

_Turret_State TurretState;
_Turret_State NewTurretState;

uint32_t DelayTurret;
//
// Init buffers for comunication
//
void InitApp( void )
{
	TurretState = IDLE;
	NewTurretState = IDLE;
	//HAL_ADC_Start(&hadc);
	UnlockTurret();
}
void MainLoop( void )
{

	if(CheckIfEnabled())
	{
		CheckNewTool();

		if(TurretState != NewTurretState)
		{
		  switch (NewTurretState)
		  {
			case IDLE:
				UnlockTurret();
				TurretState = IDLE;
				break;
			case FORWARD:
				ForwardTurret();
				TurretState = FORWARD;
				break;
			case REVERSE:
				ReverseTurret();
				TurretState = REVERSE;
				break;
			case LOCK:
				LockTurret();
				TurretState = LOCK;
				break;
			case WAIT:
				WaitOverTravel();
				break;
		  }
		}
	}
}

// Dummyfunktion d� alla typer av delay inte fungerar!!!
void WaitOverTravel()

{
	DelayTurret ++;
	if(DelayTurret > 17000)
	{
		SetCurentLimit(0);
		NewTurretState = REVERSE;
	}
}

uint8_t CheckIfEnabled( void )
{
	GPIO_PinState state;

	uint8_t isEnabled;

	state = HAL_GPIO_ReadPin(ENABLE_GPIO_Port, ENABLE_Pin);
	if(state == GPIO_PIN_RESET)
	{
		NewTurretState = IDLE;
		isEnabled = 0;
		UnlockTurret();
		HAL_GPIO_WritePin(LED_ENABLED_GPIO_Port, LED_ENABLED_Pin, 0);
	}
	else
	{
		if(TurretState == IDLE)
		{
			NewTurretState = LOCK;
		}
		isEnabled = 1;
		HAL_GPIO_WritePin(LED_ENABLED_GPIO_Port, LED_ENABLED_Pin, 1);
	}
	return isEnabled;
}

void CheckNewTool( void )
{
	GPIO_PinState state;

	if((TurretState == IDLE) || (TurretState == LOCK) )
	{
		state = HAL_GPIO_ReadPin(TOOL_CHANGE_GPIO_Port, TOOL_CHANGE_Pin);
		if(state == GPIO_PIN_SET)
		{
			NewTurretState = FORWARD;
			SetTurretStatusLocked(false);
		}
	}
}

uint8_t GetCurrentTool( void )
{
	/*
	T  ENCODER Value (Gray code)
	1  1000 0x08
	2  1100 0x0c
	3  0100 0x04
	4  0110 0x06
	5  0010 0x02
	6  0011 0x03
	7  0001 0x01
	8  1001 0x09
	*/

	uint8_t value = 0;
	uint8_t toolNo = 0;

	if(HAL_GPIO_ReadPin(ENC_1_GPIO_Port, ENC_1_Pin))
	{
		value = value + 1;
	}
	if(HAL_GPIO_ReadPin(ENC_2_GPIO_Port, ENC_2_Pin))
	{
		value = value + 2;
	}
	if(HAL_GPIO_ReadPin(ENC_3_GPIO_Port, ENC_3_Pin))
	{
		value = value + 4;
	}
	if(HAL_GPIO_ReadPin(ENC_4_GPIO_Port, ENC_4_Pin))
	{
		value = value + 8;
	}

	switch (value)
	{
		case 2:
			toolNo = 1;
			break;
		case 6:
			toolNo = 2;
			break;
		case 4:
			toolNo = 3;
			break;
		case 12:
			toolNo = 4;
			break;
		case 8:
			toolNo = 5;
			break;
		case 9:
			toolNo = 6;
			break;
		case 1:
			toolNo = 7;
			break;
		case 3:
			toolNo = 8;
			break;
	}

	return toolNo;
}

uint8_t GetSelectedTool( void )
{
	uint8_t toolNo = 0;


	if(HAL_GPIO_ReadPin(TOOL_SEL_1_GPIO_Port, TOOL_SEL_1_Pin))
	{
		toolNo = 1;
	}
	else if(HAL_GPIO_ReadPin(TOOL_SEL_2_GPIO_Port, TOOL_SEL_2_Pin))
	{
		toolNo = 2;
	}
	else if(HAL_GPIO_ReadPin(TOOL_SEL_3_GPIO_Port, TOOL_SEL_3_Pin))
	{
		toolNo = 3;
	}
	else if(HAL_GPIO_ReadPin(TOOL_SEL_4_GPIO_Port, TOOL_SEL_4_Pin))
	{
		toolNo = 4;
	}
	else if(HAL_GPIO_ReadPin(TOOL_SEL_5_GPIO_Port, TOOL_SEL_5_Pin))
	{
		toolNo = 5;
	}
	else if(HAL_GPIO_ReadPin(TOOL_SEL_6_GPIO_Port, TOOL_SEL_6_Pin))
	{
		toolNo = 6;
	}
	else if(HAL_GPIO_ReadPin(TOOL_SEL_7_GPIO_Port, TOOL_SEL_7_Pin))
	{
		toolNo = 7;
	}
	else if(HAL_GPIO_ReadPin(TOOL_SEL_8_GPIO_Port, TOOL_SEL_8_Pin))
	{
		toolNo = 8;
	}

	return toolNo;
}


void ForwardTurret( void )
{

	uint8_t CurrentTool;
	volatile uint8_t SelectedTool;

	CurrentTool = GetCurrentTool();
	SelectedTool = GetSelectedTool();

	// If new tool is selected seek forward until tool is found
	if(SelectedTool != CurrentTool)
	{
		HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_FORWARD_DIR);
		SetCurentLimit(0);
		SetTurretStatusLocked(false);
		while(SelectedTool != CurrentTool)
		{
			CurrentTool = GetCurrentTool();
			if(!CheckIfEnabled)
			{
				NewTurretState = WAIT;
				DelayTurret = 0;
			}
		}
		NewTurretState = WAIT;
		DelayTurret = 0;


	}
	// If tool already selected, lock turret again
	else
	{
		NewTurretState = LOCK;
	}
}

void ReverseTurret( void )
{

	__IO uint32_t ADCValue=0;


	//

	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_REVERSE_DIR);
	HAL_Delay(100);
	SetCurentLimit(1);
	HAL_Delay(1000);
//	while(ADCValue < LOCKTHRESHOLD)
//
//    {
//		//HAL_ADC_Start(&hadc);
//		//HAL_ADC_PollForConversion(&hadc, 5);
//		//ADCValue = HAL_ADC_GetValue(&hadc);
//    }
//	SetCurentLimit(1);
	NewTurretState = LOCK;
}


void LockTurret( void )
{

	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_REVERSE_DIR);
	SetCurentLimit(1);
	SetTurretStatusLocked(true);

}

void UnlockTurret( void )
{
	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_REVERSE_DIR);
	SetTurretStatusLocked(false);
//	SetCurentLimit(0);
	HAL_GPIO_WritePin(MOTOR_ONOFF_GPIO_Port, MOTOR_ONOFF_Pin, GPIO_PIN_RESET);
}

void SetTurretStatusLocked(uint8_t locked)
{
	if(!locked)
	{
		HAL_GPIO_WritePin(LED_LOCK_GPIO_Port, LED_LOCK_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(TOOL_CHANGE_READY_GPIO_Port, TOOL_CHANGE_READY_Pin, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(LED_LOCK_GPIO_Port, LED_LOCK_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(TOOL_CHANGE_READY_GPIO_Port, TOOL_CHANGE_READY_Pin, GPIO_PIN_SET);
	}
}

void SetCurentLimit(uint8_t value)
{

	if(value)
	{
		HAL_GPIO_WritePin(MOTOR_CURENT_GPIO_Port, MOTOR_CURENT_Pin, GPIO_PIN_SET);
	}
	else
	{
		HAL_GPIO_WritePin(MOTOR_CURENT_GPIO_Port, MOTOR_CURENT_Pin, GPIO_PIN_RESET);
	}

	HAL_GPIO_WritePin(MOTOR_ONOFF_GPIO_Port, MOTOR_ONOFF_Pin, GPIO_PIN_SET);

}
