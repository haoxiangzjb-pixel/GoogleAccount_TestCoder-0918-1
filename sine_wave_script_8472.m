% This script plots a sine wave

% Define the x-axis values
x = linspace(0, 4*pi, 1000);

% Calculate the sine values
y = sin(x);

% Create the plot
figure;
plot(x, y);

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Sine Wave');

% Add a grid
grid on;