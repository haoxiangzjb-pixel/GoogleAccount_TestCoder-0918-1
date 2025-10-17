function [x, flag] = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 解向量
%   flag - 求解状态标志 ('success', 'singular', 'inconsistent')

    % 检查输入维度是否匹配
    if size(A, 1) ~= length(b)
        error('系数矩阵A的行数必须与向量b的长度相同');
    end
    
    % 检查矩阵是否为奇异矩阵
    if rank(A) < min(size(A))
        % 尝试使用最小二乘法求解
        if rank([A, b]) > rank(A)
            % 系统不一致
            x = [];
            flag = 'inconsistent';
        else
            % 使用最小二乘解
            x = A \ b;
            flag = 'least_squares';
        end
    else
        % 矩阵非奇异，直接求解
        x = A \ b;
        flag = 'success';
    end
end

% 示例用法
% A = [2, 1, 1; 1, 3, 2; 1, 0, 0];
% b = [4; 5; 1];
% [x, flag] = solve_linear_system(A, b);
% fprintf('解: x = [%f, %f, %f]\n', x);
% fprintf('状态: %s\n', flag);