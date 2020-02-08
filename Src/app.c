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

#define TURRET_RUN_DIR  	GPIO_PIN_RESET	// Direction
#define TURRET_LOCK_DIR 	GPIO_PIN_SET
#define TURRET_RUN_POWER  	2000		// Max power = 2000.
#define TURRET_LOCK_POWER 	200		// Selected lock power = 10% of max

typedef enum
{
  IDLE = 0,
  SEARCH_TOOL,
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
	UnlockTurret();
}
void MainLoop( void )
{

	CheckEnabled();

	if(TurretState != NewTurretState)
	{
	  switch (TurretState) {
		case IDLE:
			UnlockTurret();
			break;
		case SEARCH_TOOL:
			break;
		case REVERSE:
			break;
		case LOCK:
			LockTurret();
			break;
	  }
	  TurretState = NewTurretState;
	}
}

void CheckEnabled( void )
{
	GPIO_PinState state;

	state = HAL_GPIO_ReadPin(ENABLED_GPIO_Port, ENABLED_Pin);
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
void LockTurret( void )
{
	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_LOCK_DIR);
	HAL_GPIO_WritePin(LED_LOCK_GPIO_Port, LED_LOCK_Pin, GPIO_PIN_SET);
	user_pwm_setvalue(TURRET_LOCK_POWER);
}

void UnlockTurret( void )
{
	HAL_GPIO_WritePin(MOTOR_DIR_GPIO_Port, MOTOR_DIR_Pin, TURRET_LOCK_DIR);
	HAL_GPIO_WritePin(LED_LOCK_GPIO_Port, LED_LOCK_Pin, GPIO_PIN_RESET);
	user_pwm_setvalue(0);
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
