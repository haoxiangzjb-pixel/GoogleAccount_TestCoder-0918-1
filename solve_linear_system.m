function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 方程组的解向量
%
% 示例:
%   A = [2, 1; 1, -1];
%   b = [3; 0];
%   x = solve_linear_system(A, b);

    % 检查输入矩阵的维度是否匹配
    [m, n] = size(A);
    if m ~= length(b)
        error('系数矩阵A的行数必须与常数向量b的长度相同');
    end
    
    % 检查矩阵是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('系数矩阵不是方阵，可能无解或有无穷多解');
    end
    
    % 检查矩阵的条件数，判断是否为病态矩阵
    cond_A = cond(A);
    if cond_A > 1e12
        warning('系数矩阵接近奇异，解可能不准确');
    end
    
    % 使用左除运算求解线性方程组
    x = A \ b;
    
    % 验证解的正确性
    residual = norm(A * x - b);
    if residual > 1e-10
        warning('解的残差较大，可能不准确。残差为: %f', residual);
    end
end