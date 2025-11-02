# Chapter 6: Ball & Beam Experiments

### Objective
To stabilize a classic "unstable" system: balancing a ball on a beam. This is a benchmark problem in control engineering.

### Key Files
* `psd_test.m`: A script to calibrate the PSD (Position Sensitive Device) sensor.
* `bb_pid_hg_s1.mdl`: The main controller, which implements an **I-PD + Feedforward (FF)** structure. This model is designed for the high-power gearbox setup.

### ❗ Important Note
This experiment is very sensitive to hardware setup and calibration. The I-PD controller handles stabilization, while the Feedforward (FF) term helps pre-emptively move the beam to the correct angle based on the ball's target position.