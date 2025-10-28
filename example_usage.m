% 示例：使用solve_linear_system函数求解线性方程组
%
% 例如求解方程组:
% 2x + 3y = 7
% 4x - y = 1

% 定义系数矩阵A和常数向量b
A = [2, 3;
     4, -1];
b = [7; 1];

% 调用函数求解
fprintf('求解线性方程组:\n');
fprintf('2x + 3y = 7\n');
fprintf('4x - y = 1\n\n');
solution = solve_linear_system(A, b);

% 验证解
fprintf('\n验证解:\n');
result = A * solution;
fprintf('Ax = [%f; %f]\n', result(1), result(2));
fprintf('b  = [%f; %f]\n', b(1), b(2));

% 另一个例子：三元线性方程组
fprintf('\n\n----------------------------------------\n');
fprintf('另一个例子：三元线性方程组\n');
fprintf('x + 2y + 3z = 9\n');
fprintf('2x - y + z = 8\n');
fprintf('3x - z = 3\n\n');

A2 = [1, 2, 3;
      2, -1, 1;
      3, 0, -1];
b2 = [9; 8; 3];

solution2 = solve_linear_system(A2, b2);