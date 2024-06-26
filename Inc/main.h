/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32l1xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
extern TIM_HandleTypeDef htim4;
extern TIM_HandleTypeDef htim9;

//extern ADC_HandleTypeDef hadc;

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define ENC_1_Pin GPIO_PIN_0
#define ENC_1_GPIO_Port GPIOC
#define ENC_2_Pin GPIO_PIN_1
#define ENC_2_GPIO_Port GPIOC
#define ENC_3_Pin GPIO_PIN_2
#define ENC_3_GPIO_Port GPIOC
#define ENC_4_Pin GPIO_PIN_3
#define ENC_4_GPIO_Port GPIOC
#define BUTTON_Pin GPIO_PIN_0
#define BUTTON_GPIO_Port GPIOA
#define MOTOR_DIR_Pin GPIO_PIN_1
#define MOTOR_DIR_GPIO_Port GPIOA
#define MOTOR_ONOFF_Pin GPIO_PIN_2
#define MOTOR_ONOFF_GPIO_Port GPIOA
#define MOTOR_CURENT_Pin GPIO_PIN_3			// Set relay with resistor
#define MOTOR_CURENT_GPIO_Port GPIOA
#define TURRET_P1_Pin GPIO_PIN_10
#define TURRET_P1_GPIO_Port GPIOB
#define TURRET_P2_Pin GPIO_PIN_11
#define TURRET_P2_GPIO_Port GPIOB
#define TURRET_P3_Pin GPIO_PIN_12
#define TURRET_P3_GPIO_Port GPIOB
#define TURRET_P4_Pin GPIO_PIN_13
#define TURRET_P4_GPIO_Port GPIOB
#define ENABLE_Pin GPIO_PIN_7
#define ENABLE_GPIO_Port GPIOC
#define TOOL_CHANGE_READY_Pin GPIO_PIN_8
#define TOOL_CHANGE_READY_GPIO_Port GPIOC
#define TOOL_CHANGE_Pin GPIO_PIN_9
#define TOOL_CHANGE_GPIO_Port GPIOC
#define TOOL_SEL_1_Pin GPIO_PIN_8
#define TOOL_SEL_1_GPIO_Port GPIOA
#define TOOL_SEL_2_Pin GPIO_PIN_9
#define TOOL_SEL_2_GPIO_Port GPIOA
#define TOOL_SEL_3_Pin GPIO_PIN_10
#define TOOL_SEL_3_GPIO_Port GPIOA
#define TOOL_SEL_4_Pin GPIO_PIN_11
#define TOOL_SEL_4_GPIO_Port GPIOA
#define TOOL_SEL_5_Pin GPIO_PIN_12
#define TOOL_SEL_5_GPIO_Port GPIOA
#define TOOL_SEL_8_Pin GPIO_PIN_15
#define TOOL_SEL_8_GPIO_Port GPIOA
#define TOOL_SEL_7_Pin GPIO_PIN_10
#define TOOL_SEL_7_GPIO_Port GPIOC
#define TOOL_SEL_6_Pin GPIO_PIN_11
#define TOOL_SEL_6_GPIO_Port GPIOC
#define LED_LOCK_Pin GPIO_PIN_6
#define LED_LOCK_GPIO_Port GPIOB
#define LED_ENABLED_Pin GPIO_PIN_7
#define LED_ENABLED_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
