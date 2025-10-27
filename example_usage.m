% 示例：使用 solve_linear_system 函数求解线性方程组

% 示例1: 2x2方程组
% 2x + y = 3
% x - y = 0
A1 = [2, 1; 1, -1];
b1 = [3; 0];
x1 = solve_linear_system(A1, b1);
fprintf('示例1解: x = [%.2f; %.2f]\n', x1(1), x1(2));

% 验证解
residual1 = A1 * x1 - b1;
fprintf('示例1残差: [%.2e; %.2e]\n', residual1(1), residual1(2));

% 示例2: 3x3方程组
% 2x + y + z = 8
% x + 3y + 2z = 13
% 3x + 2y + z = 10
A2 = [2, 1, 1; 1, 3, 2; 3, 2, 1];
b2 = [8; 13; 10];
x2 = solve_linear_system(A2, b2);
fprintf('\n示例2解: x = [%.2f; %.2f; %.2f]\n', x2(1), x2(2), x2(3));

% 验证解
residual2 = A2 * x2 - b2;
fprintf('示例2残差: [%.2e; %.2e; %.2e]\n', residual2(1), residual2(2), residual2(3));

% 示例3: 矩阵接近奇异的情况
A3 = [1, 1; 1.001, 1];
b3 = [2; 2.001];
x3 = solve_linear_system(A3, b3);
fprintf('\n示例3解 (接近奇异矩阵): x = [%.2f; %.2f]\n', x3(1), x3(2));