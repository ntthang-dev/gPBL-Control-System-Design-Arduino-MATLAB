% psd_plot.m
% Author: N.T.THANG HCMUT
% Date: 09/11/2025
%
% Description:
% This script implements Program 6-2 from the textbook (Section 6.2).
% Its purpose is to perform a Linear Least Squares fit on
% experimental (Distance, Voltage) data.
%
% It calculates the coefficients 'a', 'b', and 'c' for the
% non-linear sensor model:
%
%   y = a / (x + b) + c
%
% where:
%   y = distance (cm)
%   x = voltage (V)
%
% The script uses the mathematical trick of linearizing the problem:
% y = a/(x+b) + c  =>  (y-c)(x+b) = a  =>  xy + by - cx - cb = a
% =>  xy = cx - by + (a+bc)
%
% This is a linear system of the form Y_i = [x_i, y_i, 1] * [c; -b; a+bc]
% We solve this using MATLAB's ' \' (mldivide) operator.
%

%% 1. ENVIRONMENT INITIALIZATION
clear;
clc;
close all;

disp('Starting Sensor Calibration (Program 6-2)...');

%% 2. DATA INPUT
% --- IMPORTANT ---
% You MUST replace the data below with the (distance, voltage)
% pairs you measured using 'psd_test.m'.
% The data from the book is included here as a default example.
%
% Format: [ distance_cm , voltage_V ]
%
my_data = [
    6, 3.269765;
    7, 3.161251;
    8, 2.860401;
    9, 2.565210;
    10, 2.340802;
    11, 2.131994;
    12, 1.972542;
    13, 1.769717;
    14, 1.631310;
    15, 1.550665;
    16, 1.422121;
    18, 1.218025;
    20, 1.124497;
    22, 1.023128;
    24, 0.886716;
    26, 0.817967;
    28, 0.710782;
    30, 0.673470;
    32, 0.592493;
    34, 0.531564;
    36, 0.492551
];

% Extract x (voltage) and y (distance)
x = my_data(:, 2); % Voltage [V]
y = my_data(:, 1); % Distance [cm]

disp(['Loaded ' num2str(length(y)) ' data points.']);

%% 3. LEAST SQUARES CALCULATION
% This is the core of Program 6-2 [cite: 16573-16583]
N = length(x);

% Construct the 'A' matrix for the linear problem AX = Y
% A_i = [x_i, y_i, 1]
A = [x, y, ones(N, 1)];

% Construct the 'Y' vector
% Y_i = x_i * y_i
Y = x .* y;

% Solve the linear least-squares problem for X = [c; -b; a+bc]
% This is the "magic" line [cite: 16583].
X_solution = A \ Y;

%% 4. PARAMETER RECOVERY
% Extract the original 'a, b, c' parameters from the solution vector X
% X_solution(1) = c
% X_solution(2) = -b
% X_solution(3) = a + b*c
c = X_solution(1);
b = -X_solution(2);
a = X_solution(3) - (b * c); % a = X3 - b*c

% Display the results
disp('--- Calibration Complete ---');
disp('Found parameters for: y = a / (x + b) + c');
fprintf('a = %f\n', a);
fprintf('b = %f\n', b);
fprintf('c = %f\n', c);

% These values 'a, b, c' MUST be saved and used inside your
% Simulink model (e.g., in the 'Vol to cm' block in Fig 6.20)

%% 5. PLOTTING & VERIFICATION
% Create a smooth voltage vector for plotting the fitted curve
x_fit = linspace(min(x), max(x), 200);

% Calculate the distance 'y' using our new 'a,b,c' model
y_fit = a ./ (x_fit + b) + c;

% Create the verification plot (matches Fig 6.13)
figure('Name', 'PSD Sensor Calibration Curve');
plot(x, y, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6); % Measured data
hold on;
plot(x_fit, y_fit, 'r-', 'LineWidth', 2); % Calculated (fitted) curve
grid on;
xlabel('Voltage (V)');
ylabel('Distance (cm)');
title('Sensor Calibration: Measured Data vs. Fitted Model');
legend('Measured Data', 'Fitted Model: y = a/(x+b)+c');
axis([0 3.5 0 40]); % Match textbook axes