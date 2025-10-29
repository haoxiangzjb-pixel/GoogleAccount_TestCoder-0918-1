function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 方程组的解
%
% 示例:
%   A = [2, 1; 1, -1];
%   b = [3; 0];
%   x = solve_linear_system(A, b);

    % 检查输入参数
    if nargin ~= 2
        error('需要两个输入参数：系数矩阵A和常数向量b');
    end
    
    % 检查矩阵维度是否匹配
    [m, n] = size(A);
    if m ~= length(b)
        error('矩阵A的行数必须等于向量b的长度');
    end
    
    % 检查矩阵是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('系数矩阵不是方阵，可能无解或有无穷多解');
    end
    
    % 检查矩阵是否奇异
    if rcond(A) < eps
        warning('矩阵接近奇异，解可能不准确');
        x = A \ b;  % 使用MATLAB的左除运算符求解
    else
        x = A \ b;  % 使用MATLAB的左除运算符求解
    end
    
    % 验证解的正确性
    residual = norm(A * x - b);
    if residual > 1e-10
        warning('解的残差较大，可能不准确。残差值为: %f', residual);
    end
end