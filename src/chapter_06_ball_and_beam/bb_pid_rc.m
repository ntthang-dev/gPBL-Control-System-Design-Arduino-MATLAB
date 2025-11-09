%% bb_pid_rc.m

%% Initialize & load data
close all
clear all
load sim_param
load model_data

%% arm angle at servo angle 1 deg
K_theta_rc = (pi/180)*(1.5/11.5); % [rad/deg]

%% gain 1/s^2 from beam angle [rad] to ball position [cm]
K_B = (3/5*9.8)*100;

Pb = K_B/s^2;
Pbd = c2d(Pb,ts,'zoh');
[numbd,denbd] = tfdata(Pbd,'v');

%% PID parameters for ball position control
omega_n = 1.5;
zeta = 0.6;
alpha = 0.5;

p1 = (-zeta + j*sqrt(1-zeta^2))*omega_n;
p2 = (-zeta - j*sqrt(1-zeta^2))*omega_n;
p3 = -alpha;

Kp = (p1*p2 + p2*p3 + p3*p1)/K_b;
Ki = -(p1*p2*p3)/K_b;
Kd = -(p1+p2+p3)/K_b;

Kff = 0;
Kff = Ki/alpha;

disp('>>> PID parameters for Ball and Beam <<<')
fprintf('Kp = %f\n',Kp);
fprintf('Ki = %f\n',Ki);
fprintf('Kd = %f\n',Kd);
fprintf('Kff = %f\n',Kff);

%% Reference for ball position
r1 = 20-5;
r2 = 20+5;

%% LPF cut-off frequency
wf = 2*pi*2;

%% LPF for ball position sensor
Fc = wf^2/(s^2+2*0.7*wf*s+wf^2);
Fd = c2d(Fc,ts,'tustin');
[numlpf,denlpf] = tfdata(Fd,'v');

%% Open simulink model
open_system('bb_pid_rc_sl');
open_system('bb_pid_rc_sl/Ref angle')
open_system('bb_pid_rc_sl/Ball position and reference')

%% EOF of bb_pid_rc.m