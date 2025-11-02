# Chapter 7: Modern Control Theory (State-Space)

### Objective
To move from "Classical Control" (PID, frequency domain) to "Modern Control" (State-Space, time domain). This chapter re-designs the Ball & Beam controller using state-space methods.

### Key Files
* `bb_lqr_hg_s1.mdl`: Implements an **Optimal State Feedback (LQR)** controller. This assumes all system states (ball position, ball velocity, beam angle, etc.) are known.
* `bb_lqr_servo_hg_s1.mdl`: Implements an **Optimal Servo System** (LQR + Integral) to ensure zero steady-state error and improve tracking.

### ❗ Important Note
These models require the state-space matrices (A, B, C, D) for the Ball & Beam system, which are defined in `sim_init.m`. This is the theoretical peak of the gPBL course.