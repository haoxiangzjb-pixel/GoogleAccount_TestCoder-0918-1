function x = lqbcdmns(A, b)
% lqbcdmns Solves linear equation systems Ax = b using various methods
% Inputs:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   x - solution vector (n x 1)
%
% This function solves linear systems using MATLAB's built-in solvers
% It checks for matrix properties and selects the most appropriate method

    % Input validation
    if ~ismatrix(A) || ~isvector(b)
        error('A must be a matrix and b must be a vector');
    end
    
    [n, m] = size(A);
    if n ~= m
        error('A must be a square matrix');
    end
    
    if length(b) ~= n
        error('Number of equations does not match number of unknowns');
    end
    
    % Check matrix condition
    cond_A = cond(A);
    if cond_A > 1e12
        warning('Matrix is ill-conditioned, solution may be inaccurate');
    end
    
    % Solve the system
    if issymmetric(A) && chol(A, 'upper') % Check if matrix is positive definite
        % Use Cholesky decomposition for positive definite matrices
        R = chol(A);
        y = R' \ b;
        x = R \ y;
    elseif abs(det(A)) > eps  % Check if matrix is not singular
        % Use LU decomposition via backslash operator
        x = A \ b;
    else
        % Matrix is singular, use pseudoinverse
        warning('Matrix is singular, using pseudoinverse');
        x = pinv(A) * b;
    end
end