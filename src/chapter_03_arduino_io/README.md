# Chapter 3: Arduino I/O Basics

### Objective
This chapter serves as the "Hello, World!" for hardware. The goal is to establish basic communication between the PC (running Simulink) and the Arduino (acting as an I/O server).

### Experiments
* **Digital I/O:** Blinking an LED (`led_blink_s1.mdl`).
* **Analog I/O (PWM):** Fading an LED (`led_blink2_s1.mdl`).
* **Analog Input:** Reading a potentiometer (`a_read_s1.mdl`).
* **Servo Control:** Controlling an RC servo motor (`rc_servo_s1.mdl`).

### ❗ Important Note
Before running any model in this chapter, ensure the `adiosrv.pde` (or `.ino`) sketch from the ArduinoIO library has been successfully uploaded to your Arduino Mega.