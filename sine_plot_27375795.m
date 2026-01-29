% MATLAB script to plot a sine wave
% Generated randomly

% Define the time vector
t = 0:0.01:2*pi;

% Define the sine wave
y = sin(t);

% Create the plot
figure;
plot(t, y, 'b-', 'LineWidth', 2);
grid on;
xlabel('Time (radians)');
ylabel('Amplitude');
title('Sine Wave Plot');
axis([0 2*pi -1.5 1.5]);
