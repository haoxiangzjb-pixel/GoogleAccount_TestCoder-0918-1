% This MATLAB script plots a sine wave
x = linspace(0, 4*pi, 1000); % Create 1000 points from 0 to 4*pi
y = sin(x); % Calculate the sine of each point
plot(x, y); % Plot the sine wave
xlabel('x'); % Label the x-axis
ylabel('sin(x)'); % Label the y-axis
title('Sine Wave'); % Add a title to the plot
grid on; % Turn on the grid