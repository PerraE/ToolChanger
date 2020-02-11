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
#define TURRET_REVERSE_POWER 	1000		// Selected lock power = 10% of max
#define TURRET_LOCK_POWER 		200			// Selected lock power = 10% of max
#define LOCKTHRESHOLD			1500		// Threshold current while reverse to find lock position
#define false 0
#define true 1

typedef enum
{
  IDLE = 0,
  FORWARD,
  REVERSE,
  LOCK
}_Turret_State;

_Turret_State TurretState;
_Turret_State NewTurretState;


//
// Init buffers for comunication
//
void InitApp( void )
{
	TurretState = IDLE;
	NewTurretState = IDLE;
	HAL_ADC_Start(&hadc);
	UnlockTurret();
}
void MainLoop( void )
{

	CheckIfEnabled();
	CheckNewTool();

	if(TurretState != NewTurretState)
	{
	  switch (TurretState) {
		case IDLE:
			UnlockTurret();
			break;
		case FORWARD:
			ForwardTurret();
			break;
		case REVERSE:
			ReverseTurret();
			break;
		case LOCK:
			LockTurret();
			break;
	  }
	  TurretState = NewTurretState;
	}
}

void CheckIfEnabled( void )
{
	GPIO_PinState state;

	state = HAL_GPIO_ReadPin(ENABLE_GPIO_Port, ENABLE_Pin);
	if(state == GPIO_PIN_RESET)
	{
		NewTurretState = IDLE;
	}
	else
	{
		if(TurretState == IDLE)
		{
			NewTurretState = LOCK;
		}
	}
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
		value = value || 0b0001;
	}
	if(HAL_GPIO_ReadPin(ENC_2_GPIO_Port, ENC_2_Pin))
	{
		value = value || 0b0010;
	}
	if(HAL_GPIO_ReadPin(ENC_3_GPIO_Port, ENC_3_Pin))
	{
		value = value || 0b0100;
	}
	if(HAL_GPIO_ReadPin(ENC_4_GPIO_Port, ENC_4_Pin))
	{
		value = value || 0b1000;
	}

	switch (value)
	{
		case 0b1000:
			toolNo = 1;
			break;
		case 0b1100:
			toolNo = 2;
			break;
		case 0b0100:
			toolNo = 3;
			break;
		case 0b0110:
			toolNo = 4;
			break;
		case 0b0010:
			toolNo = 5;
			break;
		case 0b0011:
			toolNo = 6;
			break;
		case 0b0001:
			toolNo = 7;
			break;
		case 0b1001:
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
	uint8_t SelectedTool;

	CurrentTool = GetCurrentTool();
	SelectedTool = GetSelectedTool();

	// If new tool is selected seek forward until tool is found
	if(SelectedTool != CurrentTool)
	{
		HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_FORWARD_DIR);
		user_pwm_setvalue(TURRET_FORWARD_POWER);
		SetTurretStatusLocked(false);
		while(SelectedTool != CurrentTool)
		{
			CurrentTool = GetCurrentTool();
		}
		NewTurretState = REVERSE;
	}
	else
	{
		NewTurretState = LOCK;
	}
}

void ReverseTurret( void )
{

	__IO uint32_t ADCValue=0;

	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_REVERSE_DIR);
	user_pwm_setvalue(TURRET_LOCK_POWER);

	while(ADCValue < LOCKTHRESHOLD)
    if (HAL_ADC_PollForConversion(&hadc, 1000000) == HAL_OK)
    {
        ADCValue = HAL_ADC_GetValue(&hadc);
    }
}


void LockTurret( void )
{

	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_REVERSE_DIR);
	user_pwm_setvalue(TURRET_LOCK_POWER);
	SetTurretStatusLocked(true);

}

void UnlockTurret( void )
{
	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_REVERSE_DIR);
	SetTurretStatusLocked(false);
	user_pwm_setvalue(0);
}

void SetTurretStatusLocked(uint8_t ready)
{
	if(ready)
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

void user_pwm_setvalue(uint16_t value)
{
    TIM_OC_InitTypeDef sConfigOC;

    sConfigOC.OCMode = TIM_OCMODE_PWM1;
    sConfigOC.Pulse = value;
    sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
    sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;

    HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_2);
    HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_2);

    HAL_TIM_PWM_ConfigChannel(&htim9, &sConfigOC, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim9, TIM_CHANNEL_1);

}
