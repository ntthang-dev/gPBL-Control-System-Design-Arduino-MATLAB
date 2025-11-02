% run_ch4_3_p_control.m
% Author: N.T.THANG
% Date: 02/11/2025
%
% Description:
% This script runs a proportional (P) control experiment on the DC motor
% speed control setup as described in Chapter 4.3 of the textbook.
% It uses the Simulink model 'velo_p.mdl'.
%
% We will test several values for the proportional gain (Kp) to observe
% the trade-off between steady-state error and system stability
% (oscillation), as shown in Figs 4.11 and 4.12.
%

%% 1. ENVIRONMENT INITIALIZATION
clear;
clc;
close all;

disp('Starting Experiment 4.3: Proportional (P) Control...');

%% 2. PARAMETER CONFIGURATION
% Set sample time (Ts)
% Using 20Hz as established in the previous step.
ts = 1/20; % [s] Sample time (20 Hz)

% Set simulation duration
sim_duration = 40; % [s]

% --- !!! CRITICAL PARAMETER: Proportional Gain !!! ---
% You must run this script multiple times.
% For each run, change Kp to one of these values:
% Kp = 2;
Kp = 4;
% Kp = 8;
% Kp = 16;
% 

disp(['Testing with Kp = ' num2str(Kp)]);

%% 3. SIMULINK MODEL EXECUTION
model_name = 'velo_p';

try
    disp(['Opening model: ' model_name]);
    % Load the model, but do not open the window
    load_system(model_name);
    
    % Open the scope to observe results
    open_system([model_name '/Output'], 'block');

    % Assign variables to the MATLAB base workspace
    % so the Simulink model can use them.
    assignin('base', 'ts', ts);
    assignin('base', 'Kp', Kp);

    disp(['Running simulation for ' num2str(sim_duration) ' seconds...']);
    
    % Run the simulation
    sim(model_name, sim_duration);
    
    disp('Simulation finished.');

catch e
    disp('ERROR: Could not run simulation.');
    disp('Please ensure "velo_p.mdl" is in the MATLAB path.');
    disp(e.message);
end