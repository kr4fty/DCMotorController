/*
 * GBRL Mega 2560:
 *   #define X_STEP_BIT    2 // MEGA2560 Digital Pin 24
 *   #define Y_STEP_BIT    3 // MEGA2560 Digital Pin 25
 *   #define Z_STEP_BIT    4 // MEGA2560 Digital Pin 26
 *
 *   #define X_DIRECTION_BIT   7 // MEGA2560 Digital Pin 30 (PC7)
 *   #define Y_DIRECTION_BIT   6 // MEGA2560 Digital Pin 31 (PC6)
 *   #define Z_DIRECTION_BIT   5 // MEGA2560 Digital Pin 32
 *
 *   #define STEPPERS_DISABLE_BIT   7 // MEGA2560 Digital Pin 13
 *
 * GRBL config:
 *   $100=75.000    (x, step/mm)
 *   $101=75.000    (y, step/mm)
 *   $102=75.000    (z, step/mm)
 *   $110=2500.000  (x max rate, mm/min)
 *   $111=2500.000  (y max rate, mm/min)
 *   $112=2500.000  (z max rate, mm/min)
 *   $120=75.000    (x accel, mm/sec^2)
 *   $121=75.000    (y accel, mm/sec^2)
 *   $122=75.000    (z accel, mm/sec^2)
 *   $130=200.000   (x max travel, mm)
 *   $131=200.000   (y max travel, mm)
 *   $132=200.000   (z max travel, mm)
 *
 */

#ifndef _MOTOR_H
#define _MOTOR_H

#define MOTOR1      // Estara habilitado si se esta definido
#define MOTOR2      // Pueden estar tanto el uno, el otro o ambos

//#define DEBUG     // Muestrar posicion actual y estado de los setPoins
#define PWM31KHZ    // Habilito la salida de pwm, OC1x y OC2x, a 31.25 KHz
                    // Si no se define, la frecuencia pwm por dafult es de 976Hz

#if (not defined(MOTOR1)) && (not defined(MOTOR2)) && (not defined(MOTOR2))
  #error seleccione AL MENOS un Motor
#endif

  #ifdef MOTOR1
    #define pwmX 10 // Habilito/Desabilito, chip enable, del L293D
    #define in1X  6 // Salida hacia el pin 2, IN1, del L293D
    #define in2X  5 // Salida hacia el pin 7, IN2, del L293D
    #define inAX A2 // Entrada INA desde el encoder
    #define inBX A3 // Entrada INB desde el encoder
    #define stepX 2 // Entrada STEP proveniente del otro Arduino cargado con GRBL
    #define dirX 12 // Entrada DIR proveniente del otro Arduino cargado con GRBL
  #endif

  #ifdef MOTOR2
    #define pwmY 11
    #define in1Y  8
    #define in2Y  9
    #define inAY A0
    #define inBY A1
    #define stepY 3
    #define dirY 13
  #endif

  #define ena A5    // Entrada ENABLE proveniente del Arduino cargado con GRBL
                    // es activo en nivel bajo

  // PID Parameters
  #define AGGKp      10   // Agresive Kp
  #define AGGKi       1   // Agresive Ki
  #define AGGKd    0.01   // Agresive Kd

  #define CONSKp      5   // Conservative Kp
  #define CONSKi    0.1   // Conservative Ki
  #define CONSKd  0.001   // Conservative Kd

#endif
