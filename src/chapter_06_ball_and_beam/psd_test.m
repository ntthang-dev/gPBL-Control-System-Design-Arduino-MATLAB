% psd_test.m
% Author: N.T.THANG HCMUT
% Date: 09/11/2025
%
% Description:
% This script implements Program 6-1 from the textbook (Section 6.2).
% Its purpose is to take multiple analog readings from the PSD sensor
% (GP2Y0A21) and compute a stable average voltage.
%
% This is a *measurement utility* used to manually collect data for
% sensor calibration.
%
% HOW TO USE:
% 1. Place the calibration object (e.g., a white block) at a KNOWN 
%    distance (e.g., 6.0 cm) from the sensor.
% 2. Run this script.
% 3. Record the "Average Voltage" (e.g., 3.269765 V) in a notebook.
% 4. Move the object to the next known distance (e.g., 7.0 cm).
% 5. Repeat.
% 6. Manually enter these (distance, voltage) pairs into 'psd_plot.m'.
%

%% 1. ENVIRONMENT INITIALIZATION
clear;
clc;
close all;

disp('Starting Sensor Reading Utility (Program 6-1)...');

%% 2. PARAMETERS
% --- Configuration ---
ARDUINO_PORT = 'COM3'; % <-- IMPORTANT: Change this to your COM port
ANALOG_PIN = 2;        % Per textbook, A2 is used for PSD sensor
NUM_SAMPLES = 500;     % Number of samples to average (as in book)
% ---------------------

% Pre-allocate a vector to store the history of readings
v_hist = zeros(NUM_SAMPLES, 1);

%% 3. ARDUINO CONNECTION
try
    % Connect to the Arduino
    a = arduino(ARDUINO_PORT);
    disp(['Successfully connected to Arduino on ' ARDUINO_PORT]);
    
    % Set the analog reference voltage to DEFAULT (5V)
    a.analogReference('default');
    
    % Create a cleanup object to ensure the port is released
    % This runs automatically when the script ends or is stopped (Ctrl+C)
    cleanup = onCleanup(@() delete(a));
    
catch e
    disp('ERROR: Could not connect to Arduino.');
    disp('Please check COM port, connection, and if ''adiosrv.pde'' is uploaded.');
    disp(e.message);
    return; % Stop the script
end

%% 4. DATA ACQUISITION (SAMPLING)
disp(['Taking ' num2str(NUM_SAMPLES) ' samples from Analog Pin A' num2str(ANALOG_PIN) '...']);

tic; % Start timer
for i = 1:NUM_SAMPLES
    % a.analogRead() returns a digital value (0-1023)
    digital_value = a.analogRead(ANALOG_PIN);
    
    % Convert the digital value back to a physical voltage
    % V_in = Digital_Value * (V_ref / (2^10 - 1))
    v_hist(i) = digital_value * (5.0 / 1023.0);
    
    % Optional: print real-time voltage
    if mod(i, 50) == 0
        fprintf('Sample %d/%d... Voltage: %f V\n', i, NUM_SAMPLES, v_hist(i));
    end
    
    % A small pause to avoid flooding the serial buffer
    pause(0.001); 
end
toc; % Stop timer

%% 5. DATA ANALYSIS & RESULTS
disp('--- Measurement Complete ---');

% Calculate the average (mean) voltage
v_ave = mean(v_hist);

% Display the final, stable average voltage
% THIS IS THE VALUE YOU MUST WRITE DOWN
fprintf('\nAverage Voltage: %f V\n', v_ave);

% Plot the history of the readings to see the noise
figure('Name', 'PSD Sensor Noise Profile');
t = 1:NUM_SAMPLES;
plot(t, v_hist, 'b.', 'MarkerSize', 2); % Plot samples as blue dots
hold on;
plot(t, ones(NUM_SAMPLES, 1) * v_ave, 'r-', 'LineWidth', 2); % Plot average as red line
hold off;
xlabel('Sample Number');
ylabel('Voltage (V)');
title(['Sensor Reading History (Pin A' num2str(ANALOG_PIN) ')']);
legend('Measured Samples', ['Average = ' num2str(v_ave) ' V']);
axis([0 NUM_SAMPLES 0 5]); % Set axis from 0-5V

%% 6. CLEANUP
% 'cleanup' object runs automatically here
disp('Releasing Arduino COM port.');