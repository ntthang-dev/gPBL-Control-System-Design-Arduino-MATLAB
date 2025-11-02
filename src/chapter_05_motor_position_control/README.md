# Chapter 5: Motor Position Control

### Objective
To design controllers for a second-order system (the motor's position). This chapter is more advanced, moving beyond simple PID to improve performance.

### Key Files
* `pos_id_step_s1.mdl`: Used for system identification of the position control model.
* `pos_pid_mbd_s1.mdl`: A standard **PID controller** designed using Pole Assignment.
* `pos_pid2_mbd_s1.mdl`: An improved **I-PD controller**. This structure avoids "setpoint kick" (the large initial control effort) by moving the integral (I) and proportional (P) actions.
* `pos_tdof_mbd_s1.mdl`: The most advanced model. A **Two-Degree-of-Freedom (TDOF)** controller that separates setpoint tracking from disturbance rejection.

### ❗ Important Note
This chapter demonstrates the *evolution* of a controller. Make sure `sim_init.m` has been run, as the TDOF model relies on many parameters calculated in the textbook.