# Chapter 8: Run on Target Hardware (RoTH)

### Objective
To achieve true real-time performance by compiling the Simulink model into C++ code and deploying it to run *directly* on the Arduino Mega. This removes the PC from the loop.

### Key Files
* `bbt_pid_hg_s1.mdl`: The Ball & Beam PID controller (from Ch. 6) configured for RoTH.
* `bbt_lqr_hg_s1.mdl`: The LQR controller (from Ch. 7) configured for RoTH.

### ❗ Important Note
These models require the **MATLAB Coder** and **Simulink Coder** toolboxes.

* **To run:** Do NOT press the normal "Run" button.
* **To deploy:** Change the Simulink mode to "External" for testing, or use the **"Deploy to Hardware"** button in the "Hardware" tab to compile and flash the code to the Arduino.