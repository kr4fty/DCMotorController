# DCMotorController

Control de lazo cerrado para motores DC utilizando un ATMEGA328p (corazón del
  Arduino UNO) y un puente H tipo L293.

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [DCMotorController](#dcmotorcontroller)
	- [Descripción](#descripcin)
	- [Funcionamiento](#funcionamiento)
		- [Parámetros PID](#parmetros-pid)
	- [Características:](#caractersticas)
	- [Firmware](#firmware)
		- [Dependencias](#dependencias)
	- [Hardware](#hardware)
		- [Esquematico](#esquematico)
	- [Video](#video)
	- [Motores de corriente continua](#motores-de-corriente-continua)
		- [Ventajas de los Motores DC frente a los PaP](#ventajas-de-los-motores-dc-frente-a-los-pap)
		- [Desventajas de los Motores DC frente a los PaP](#desventajas-de-los-motores-dc-frente-a-los-pap)
	- [Proyectos Similares](#proyectos-similares)
	- [Licencia](#licencia)
	- [Autor](#autor)

<!-- /TOC -->

<p align="center">
  <img src="https://github.com/kr4fty/DCMotorController/blob/master/hardware/3d.png">
</p>

## Descripción
Este es una pequeña implementación de la librería [ArduinoPID](https://github.com/br3ttb/Arduino-PID-Library), para el control
de motores de corriente continua, DC, que cuenten con un encoder acoplado a su
eje.

Cuenta con soporte para **uno** o **dos** motores, dependiendo de como este
configurado dentro de _**motor.h**_.

La idea principal del proyecto es la de utilizar MOTORES DC/Servos en proyectos
de construcción de CNC en lugar de los tradicionales Motores Paso a Paso (PaP).

El sistema es compatible a nivel de pins de control, con los driver para motores
PaP, **STEP** y **DIR**, como por ejemplo el [Pololu A4988](https://www.pololu.com/product/1182).

## Funcionamiento
Un Arduino cargado con **GRBL**, por ejemplo, envía un pulso a través del pin **STEP**. Cada pulso que recibe el driver le dice al motor que tiene que avanzar un micropaso.

Luego por medio del pin **DIR** obtenemos la dirección de avance, si queremos ir en el sentido de las agujas del reloj, o al contrario.

De esta forma, cada vez que el driver recibe un pulso en el pin **STEP**, el circuito comprueba el estado del pin **DIR**, y alimenta las bobinas del motor en el orden adecuado.

### Parámetros PID
El proceso de sintonizado del PID se hizo de forma experimental, prueba/error, tratando de tener tanto el **overshoot** como el **tiempo de establecimiento** los mas chicos posibles.
Se llego a la conclusión que para el par de motores utilizados, los parámetros que mejor se ajustaban fueron los siguientes:

  * Setpoint > 50: </br>
      Kp = 10 // Agresive Kp</br>
      Ki = 1 // Agresive Ki</br>
      Kd = 0.01 // Agresive Kd</br>

  * Setpoint =< 50:</br>
      Kp = 5  // Conservative Kp</br>
      Ki = 0.1  // Conservative Ki</br>
      Kd = 0.001  // Conservative Kd</br>

Dependiendo del tipo de Motor/Servo utilizados, estos parámetros deberán ser cambiados. Esto ultimo se realizara modificando los prarametros AGGKp,AGGKi, AGGKd, CONSKp, CONSKi y CONSKd, dentro de **motor.h**

## Características:
  * El conjunto Driver-Servo/Motor remplaza al conjunto Driver-Motor/PaP
  * El corazón del sistema es un chip **ATMEGA328p**
  * Se puede controlar uno o dos motores simultáneamente
  * El Driver tiene cuatro señales de control: **DIR**, **STEP**, **ENABLE** y **RESET**
  * Cada motor puede ser controlado de forma independiente por medio de **DIR** y
    **STEP**
  * El sistema de control esta basado en un sistema PID
  * El PWM trabaja a una frecuencia de 31.25KHz, imperceptible al oído humano
  * Cuenta con un salida por puerto serie para depuración
  * Tanto las señales de entrada de los STEPs como las de los encoders, utilizan
    interrupciones del tipo **PIN CHANGE** (PCI)
  * El diseño del **PCB** fue realizado en [KiCAD](https://github.com/KiCad/)
  * La etapa de potencia de los motores fue realizada con un **puente H** del tipo L293D

## Firmware
### Dependencias
El proyecto depende de cuatro librerías:
  * [ArduinoPID](https://github.com/br3ttb/Arduino-PID-Library): Librería principal con la que se realiza el control de lazo
    cerrado
  * [EnableInterrupt](https://github.com/GreyGnome/EnableInterrupt): Encargada de vincular las interrupciones del tipo Pin-change con la respectiva ISR.
  * [EncoderPCI](https://github.com/kr4fty/EncoderPCI): Librería encargada de manejar los Encoders
  * [DCMotorServoPCI](https://github.com/kr4fty/DCMotorServoPCI): Es la librería en si, que realiza la gestión y el control del
    motor dc

## Hardware
Pins utilizados:

<table>
	<tr><th></th><th> Motor 1 </th></tr>
	<tr><th> <b>Arduino Pin</b> </th><th> <b>Descripción</b> </th></tr>
	<tr><td>10 </td><td> pwmX, chip enable 1 del L293D </td></tr>
	<tr><td>6  </td><td> in1X, salida hacia el pin 2, IN1, del L293D </td></tr>
	<tr><td>5  </td><td> in2X, salida hacia el pin 7, IN2, del L293D </td></tr>
	<tr><td>A2 </td><td> inAX, entrada A desde el encoder </td></tr>
	<tr><td>A3 </td><td> inBX, entrada B desde el encoder </td></tr>
	<tr><td>2  </td><td> stepX, entrada STEP proveniente del otro Arduino cargado con GRBL </td></tr>
	<tr><td>12 </td><td> dirX, entrada DIR proveniente del otro Arduino cargado con GRBL </td></tr>
</table>

<table>
	<tr><th></th><th> Motor 2 </th></tr>
	<tr><th> <b>Arduino Pin</b> </th><th> <b>Descripción</b> </th></tr>
	<tr><td> 11 </td><td> pwmY, chip enable 2 del L293D </td></tr>
	<tr><td> 8 </td><td> in1Y, salida hacia el pin 10, IN3, del L293D </td></tr>
	<tr><td> 9 </td><td> in2Y, salida hacia el pin 15, IN4, del L293D </td></tr>
	<tr><td> A0 </td><td> inAY, entrada A desde el encoder </td></tr>
	<tr><td> A1 </td><td> inBY, entrada B desde el encoder </td></tr>
	<tr><td> 3 </td><td> stepY, entrada STEP </td></tr>
	<tr><td> 13 </td><td> dirY, entrada DIR </td></tr>
</table>

<table>
	<tr><th></th><th> Global </th></tr>
	<tr><th> <b>Arduino Pin</b> </th><th> <b>Descripción</b> </th></tr>
	<tr><td> A5 </td><td> entrada ENABLE </td></tr>
	<tr><td> Rst </td><td> Reset del driver </td></tr>
</table>

### Esquematico

<p align="center">
  <br><br>
  <b>Circuito</b><br>
  <img src="https://github.com/kr4fty/DCMotorController/blob/master/hardware/circuit.png">
  <br>
</p>


## Video
<p align="center">
  <b>YouTube</b><br>
  <a href="https://www.youtube.com/watch?v=HcTcVE0kusM">
  <img src="https://github.com/kr4fty/DCMotorController/blob/master/hardware/youtube.png">
  </a>
</p>

## Motores de corriente continua

### Ventajas de los Motores DC frente a los PaP
  * Poseen gran velocidad de giro
  * Alta aceleración/Par inicial
  * Son silenciosos
  * Movimiento suave y sin saltos
  * Control medianamente sencilla
  * Electrónica mas sencilla
  * Utiliza realimentación para el control del sistema
  * Debido a este ultimo, tiene alta precisión en posición (depende fuertemente
    del encoder acoplado)

### Desventajas de los Motores DC frente a los PaP
  * La potencia de funcionamiento pico sólo se desarrolla a altas velocidades
  * Debido a sus altas velocidades estos pueden calentarse mas rápidamente
    (podría necesitar un sistemas de ventilación)
  * Inercia mas elevada (depende de la  velocidad y la carga acoplada al eje)

## Proyectos Similares
  * [ServoStrap](https://github.com/danithebest91/ServoStrap) por _danithebest91_
  * [SuryaProCell-CNC](https://github.com/suryaprocell/SuryaProCell-CNC) por _suryaprocell_
  * [DC-Servo-Controller](https://github.com/makerbot/DC-Servo-Controller) por _makerbot_
  * [dcservo](https://github.com/misan/dcservo) por _misan_

## Licencia

GPLv2

## Autor

Tapia Favio

## Feedback

Por favor agradecería que me envies cualquier duda y/o comentario para mejorar el proyecto, gracias.

Mail: technicc (at) gmail.com
