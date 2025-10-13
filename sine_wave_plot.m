% This MATLAB script plots a sine wave
% Define the x-axis values
x = linspace(0, 2*pi, 1000);

% Calculate the corresponding y-values (sine of x)
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Sine Wave');

% Add a grid for better readability
grid on;

% Optional: Save the figure as an image
% Uncomment the next line if you want to save the plot
% saveas(gcf, 'sine_wave.png');