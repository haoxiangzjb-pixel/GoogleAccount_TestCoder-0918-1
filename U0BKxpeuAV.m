% MATLAB script to plot a sine wave

% Define the x-axis values
x = linspace(0, 4*pi, 1000);

% Calculate the sine values
y = sin(x);

% Create the plot
figure;
plot(x, y);

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Plot of Sine Wave');

% Add a grid for better readability
grid on;

% Optional: Save the figure
% saveas(gcf, 'sine_wave_plot.fig'); % Saves as MATLAB figure
% print(gcf, 'sine_wave_plot.png', '-dpng'); % Saves as PNG image