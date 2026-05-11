% Sine Wave Plot
x = linspace(0, 2*pi, 1000);
y = sin(x);

figure;
plot(x, y, 'LineWidth', 2);
xlabel('x');
ylabel('sin(x)');
title('Sine Wave');
grid on;
