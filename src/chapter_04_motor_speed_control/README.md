# Chapter 4: Motor Speed Control

### Objective
To design and implement a controller for a first-order lag system (the DC motor's speed). The goal is to achieve accurate speed tracking.

### Key Files
* `velo_id_step_s1.mdl`: Used for system identification to find the motor's Gain (K) and Time Constant (T) from a step response.
* `velo_pi_mbd_s1.mdl`: The primary controller. This is a **PI controller** designed using the Model-Based Design (MBD) approach, specifically the Pole Assignment method.

### ❗ Important Note
Run the `sim_init.m` script (from the `/src/lib/` folder) before opening this model. This script loads the calculated parameters (K, T) and controller gains ($K_p$, $K_i$) into the MATLAB workspace.