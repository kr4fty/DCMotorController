#define LIBCALL_ENABLEINTERRUPT   // Para evitar conflictos de compilacion
                                  // por parte de la libreria EnableInterrupt
#include <Arduino.h>
#include <DCMotorServo.h>
#include <EnableInterrupt.h>
#include "motor.h"

#ifndef PIN_TO_BASEREG
  #define PIN_TO_BASEREG(pin) (portInputRegister(digitalPinToPort(pin)))
#endif
#ifndef PIN_TO_BITMASK
  #define PIN_TO_BITMASK(pin) (digitalPinToBitMask(pin))
#endif
#ifndef DIRECT_PIN_READ
  #define DIRECT_PIN_READ(base, mask) (((*(base)) & (mask)) ? 1 : 0)
#endif

typedef struct {
                volatile IO_REG_TYPE * pin_register;
                IO_REG_TYPE            pin_bitmask;
} Pin_internal_state_t;

double  aggKp=  AGGKp;    // Agresive Kp
double  aggKi=  AGGKi;    // Agresive Ki
double  aggKd=  AGGKd;    // Agresive Kd
double  consKp= CONSKp;   // Conservative Kp
double  consKi= CONSKi;   // Conservative Ki
double  consKd= CONSKd;   // Conservative Kd

Pin_internal_state_t pinEnable;
volatile bool enable;   // true: stop, false: run, es ACTIVO en BAJO

#ifdef MOTOR1
  DCMotorServo xAxis = DCMotorServo(in1X, in2X, pwmX, inAX, inBX);
  double actualPositionX;
  volatile double targetX=0;
  Pin_internal_state_t pinDirX;
#endif

#ifdef MOTOR2
  DCMotorServo yAxis = DCMotorServo(in1Y, in2Y, pwmY, inAY, inBY);
  double actualPositionY;
  volatile double targetY=0;
  Pin_internal_state_t pinDirY;
#endif

#ifdef MOTOR1
  static void stepCounterX()
  {
    if(DIRECT_PIN_READ(pinDirX.pin_register, pinDirX.pin_bitmask))
      targetX--;
    else
      targetX++;
  }
#endif

#ifdef MOTOR2
  static void stepCounterY()
  {
    if(DIRECT_PIN_READ(pinDirY.pin_register, pinDirY.pin_bitmask))
      targetY--;
    else
      targetY++;
  }
#endif

static void enableISR()
{
  if(DIRECT_PIN_READ(pinEnable.pin_register, pinEnable.pin_bitmask))
    enable = false; // pinEnable = 1, driver stop
  else
    enable = true;  // pinEnable = 0, driver enabled
}

void setup()
{
  noInterrupts();

  #ifdef MOTOR1
    pinMode(pwmX, OUTPUT);
    pinMode(in1X, OUTPUT);
    pinMode(in2X, OUTPUT);
    pinMode(stepX, INPUT_PULLUP); // Step
    pinMode(dirX, INPUT_PULLUP);  // Direction

    pinDirX.pin_register = PIN_TO_BASEREG(dirX);
    pinDirX.pin_bitmask = PIN_TO_BITMASK(dirX);

    enableInterrupt(stepX, stepCounterX, RISING);   // attach

    xAxis.myPID->SetTunings(aggKp,aggKi,aggKd);
    xAxis.setPWMSkip(40);
    xAxis.setAccuracy(1);
    xAxis.myPID->SetSampleTime(1);

    xAxis.setCurrentPosition(0);
    xAxis.moveTo(targetX);
  #endif

  #ifdef MOTOR2
    pinMode(pwmY, OUTPUT);
    pinMode(in1Y, OUTPUT);
    pinMode(in2Y, OUTPUT);
    pinMode(stepY, INPUT_PULLUP); // Step
    pinMode(dirY, INPUT_PULLUP);  // Direction

    pinDirY.pin_register = PIN_TO_BASEREG(dirY);
    pinDirY.pin_bitmask = PIN_TO_BITMASK(dirY);

    enableInterrupt(stepY, stepCounterY, RISING);   // attach

    yAxis.myPID->SetTunings(aggKp,aggKi,aggKd);
    yAxis.setPWMSkip(40);
    yAxis.setAccuracy(1);
    yAxis.myPID->SetSampleTime(1);

    yAxis.setCurrentPosition(0);
    yAxis.moveTo(targetY);
  #endif


    pinMode(ena, INPUT_PULLUP);  // Enable
    pinEnable.pin_register = PIN_TO_BASEREG(ena);
    pinEnable.pin_bitmask = PIN_TO_BITMASK(ena);
    enableInterrupt(ena, enableISR, CHANGE);    // attach

  #ifdef PWM31KHZ
    TCCR1B = TCCR1B & 0b11111000 | 1; // pwm a 31Kh para el pin 10, TIMER 1
    TCCR2B = TCCR2B & 0b11111000 | 1; // y para el 11, TIMER 2
  #endif

  #ifdef DEBUG
    Serial.begin(9600);
    Serial.println("Debug!");
  #endif

  interrupts();
  delay(500);

}

#ifdef DEBUG
  double oldPosX, oldPosY;
#endif

void loop()
{
  if(enable){ // if ENABLE
    #ifdef DEBUG
      #ifdef MOTOR1
        oldPosX = actualPositionX;
      #endif
      #ifdef MOTOR2
        oldPosY = actualPositionY;
      #endif
    #endif

    #ifdef MOTOR1
      xAxis.moveTo(targetX);
      actualPositionX= xAxis.getActualPosition();
      double gapX = abs(targetX-actualPositionX);

      if(gapX < 50)
        xAxis.myPID->SetTunings(consKp,consKi,consKd);  // set Conservative tunning
      else
        xAxis.myPID->SetTunings(aggKp,aggKi,aggKd);     // set Agresive tunning
    #endif

    #ifdef MOTOR2
      yAxis.moveTo(targetY);
      actualPositionY= yAxis.getActualPosition();
      double gapY = abs(targetY-actualPositionY);

      if(gapY < 50)
        yAxis.myPID->SetTunings(consKp,consKi,consKd);  // set Conservative tunning
      else
        yAxis.myPID->SetTunings(aggKp,aggKi,aggKd);;    // set Agresive tunning
    #endif

    #ifdef MOTOR1
      xAxis.run();
    #endif
    #ifdef MOTOR2
      yAxis.run();
    #endif

    #ifdef DEBUG  // DEBUG
      #ifdef MOTOR1
        #ifdef MOTOR2
          if( (oldPosX!=actualPositionX) || (oldPosY!=actualPositionY) ){
        #else
          if(oldPosX!=actualPositionX){
        #endif
            Serial.print(actualPositionX);
            Serial.print(" : ");
            Serial.print(targetX);
            #ifndef MOTOR2
              Serial.println("");
            #endif
          }
      #endif

      #ifdef MOTOR2
        #ifdef MOTOR1
          if( (oldPosX!=actualPositionX) || (oldPosY!=actualPositionY) ){
            Serial.print(" || ");
        #else
          if((oldPosY!=actualPositionY)){
        #endif
            Serial.print(actualPositionY);
            Serial.print(" : ");
            Serial.println(targetY);
          }
      #endif
    #endif      //end DEBUG
  } // end if ENABLE
  else{ //else ENABLE
    #ifdef MOTOR1
      xAxis.stop();
    #endif
    #ifdef MOTOR2
      yAxis.stop();
    #endif
  } //end else ENABLE
} // end loop
