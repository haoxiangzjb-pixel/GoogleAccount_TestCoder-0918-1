% This MATLAB script plots a sine wave
% Define the x-axis values
x = linspace(0, 2*pi, 1000);

% Calculate the sine values
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;

% Optional: Add some styling
xlim([0, 2*pi]);