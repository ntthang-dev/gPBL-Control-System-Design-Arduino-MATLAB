# Project Setup Guide

This guide provides detailed steps for setting up the hardware and software environment.

## 1. Software Installation

1.  **MATLAB/Simulink:**
    * Install MATLAB (R2021b or newer).
    * During installation, ensure you select the following toolboxes:
        * Simulink
        * Control System Toolbox
        * MATLAB Coder
        * Simulink Coder
        * [cite_start](Add any other toolboxes you used, e.g., Optimization Toolbox [cite: 470])
    * [cite_start]For SIT-provided licenses, follow the installation steps from the PDF [cite: 247-520].

2.  **Arduino IDE & Drivers:**
    * [cite_start]Download and install the Arduino IDE from the official website[cite: 240].
    * This is mainly needed to install the USB drivers for the Arduino Mega 2560.
    * Connect your Arduino Mega to the PC to confirm the COM port is recognized.

3.  **ArduinoIO Library:**
    * This project uses the ArduinoIO library to communicate between Simulink (on PC) and the Arduino (as an I/O server).
    * Download the library files (e.g., from MathWorks File Exchange or the gPBL-provided files).
    * Install the library.
    * Open the `adiosrv.pde` (or `.ino`) sketch from the library.
    * Upload `adiosrv.pde` to your Arduino Mega. **This is a critical step.**

## 2. MATLAB Path Configuration

For MATLAB to find all the project scripts and models, you must set the path correctly.

1.  Open MATLAB.
2.  In the "Home" tab, click "Set Path".
3.  Click "Add with Subfolders...".
4.  Select the `src/` folder from this repository.
5.  Click "Save" and "Close".

## 3. Run Initialization Script

Before running any simulation, run the master initialization script to load parameters into the MATLAB workspace.

```matlab
% Run this command in the MATLAB Command Window
run('src/lib/sim_init.m');