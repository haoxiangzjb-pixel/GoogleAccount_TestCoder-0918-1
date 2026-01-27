% Generate a sine wave plot
x = linspace(0, 2*pi, 100);
y = sin(x);

% Create the plot
figure;
plot(x, y, 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('sin(x)');
title('Sine Wave Plot');

% Save the figure as an image (optional)
saveas(gcf, 'sine_wave_plot.png');

fprintf('Plot created and saved to sine_wave_plot.png\n');