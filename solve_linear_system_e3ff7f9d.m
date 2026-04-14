function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
%
% 输入:
%   A - 系数矩阵 (n x n)
%   b - 常数向量 (n x 1)
%
% 输出:
%   x - 解向量 (n x 1)
%
% 示例:
%   A = [2 1; 1 3];
%   b = [5; 6];
%   x = solve_linear_system(A, b);

    % 检查输入维度
    if size(A, 1) ~= size(A, 2)
        error('系数矩阵 A 必须是方阵');
    end
    
    if length(b) ~= size(A, 1)
        error('向量 b 的维度必须与矩阵 A 的行数匹配');
    end
    
    % 检查矩阵是否奇异
    if det(A) == 0
        error('系数矩阵 A 是奇异矩阵，方程组无唯一解');
    end
    
    % 使用左除运算符求解线性方程组
    x = A \ b;
end
