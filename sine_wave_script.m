% This script plots a sine wave

% Define the x-axis values
x = linspace(0, 2*pi, 1000);

% Calculate the corresponding y-axis values (sine of x)
y = sin(x);

% Create the plot
plot(x, y);

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Plot of Sine Wave');

% Add a grid for better readability
grid on;
