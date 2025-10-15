function solution = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves a linear system of equations Ax = b
% 
% Inputs:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
%
% Output:
%   solution - solution vector x such that Ax = b

    % Check if inputs are valid
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square');
    end
    
    if length(b) ~= n
        error('Dimensions of A and b must be compatible');
    end
    
    % Check if the matrix is singular
    if rcond(A) < eps
        warning('Matrix is singular or nearly singular');
        solution = [];
        return;
    end
    
    % Solve the linear system
    solution = A \ b;
end