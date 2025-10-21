% MATLAB script to plot a sine wave
% Clear workspace and close all figures
clear all;
close all;
clc;

% Define x values from 0 to 4π with small increments
x = 0:0.01:4*pi;

% Calculate corresponding y values (sine of x)
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Sine Wave Plot');

% Add grid for better visualization
grid on;

% Set axis limits to show the full wave clearly
xlim([0 4*pi]);
ylim([-1.2 1.2]);

% Add some styling
hold on;
plot(x, zeros(size(x)), 'k--', 'LineWidth', 0.5); % Add x-axis line