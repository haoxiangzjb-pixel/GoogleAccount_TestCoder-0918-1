% This MATLAB script plots a sine wave.

% Define the x-axis values
x = linspace(0, 4*pi, 1000); % 1000 points from 0 to 4*pi

% Calculate the y-axis values (sine of x)
y = sin(x);

% Create the plot
figure; % Create a new figure window
plot(x, y, 'b-', 'LineWidth', 2); % Plot y vs x with a blue line

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Plot of a Sine Wave');

% Add a grid for better readability
grid on;

% Optionally, save the figure
% Uncomment the next line to save the plot as a PNG file
% saveas(gcf, 'sine_wave.png');