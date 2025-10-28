function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 方程组的解

    % 检查矩阵维度是否匹配
    [m, n] = size(A);
    if length(b) ~= m
        error('矩阵A的行数必须与向量b的长度相同');
    end
    
    % 检查矩阵是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('矩阵A不是方阵，可能无解或有无穷多解');
    end
    
    % 检查矩阵是否奇异
    if rcond(A) < eps
        warning('矩阵A接近奇异，解可能不准确');
        % 使用最小二乘解
        x = A \ b;
    else
        % 使用左除求解
        x = A \ b;
    end
    
    % 验证解的正确性
    residual = norm(A * x - b);
    fprintf('解的残差: %e\n', residual);
    
    % 如果残差较大，给出警告
    if residual > 1e-10
        warning('解的残差较大，可能不准确');
    end
end