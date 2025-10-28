function solution = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   solution - 方程组的解向量

    % 检查矩阵维度是否匹配
    [m, n] = size(A);
    if length(b) ~= m
        error('矩阵A的行数必须与向量b的长度相同');
    end
    
    % 检查矩阵是否为方阵且可逆
    if m == n
        % 方阵情况，检查行列式
        detA = det(A);
        if abs(detA) < eps
            warning('矩阵接近奇异，可能无唯一解');
            % 使用最小二乘解
            solution = A \ b;
        else
            % 使用矩阵除法求解
            solution = A \ b;
        end
    else
        % 非方阵，使用最小二乘解
        solution = A \ b;
    end
    
    % 验证解的正确性
    residual = norm(A * solution - b);
    if residual > 1e-10
        warning(['解的残差较大: ' num2str(residual)]);
    end
    
    fprintf('线性方程组求解完成\n');
    fprintf('解向量 x = \n');
    for i = 1:length(solution)
        fprintf('  x(%d) = %.6f\n', i, solution(i));
    end
    fprintf('残差 ||Ax-b|| = %.2e\n', residual);
end