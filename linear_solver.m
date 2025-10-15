function result = linear_solver(A, b)
% LINEAR_SOLVER Solves linear equation systems of the form Ax = b
% Inputs:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   result - solution vector (n x 1)
%
% Example usage:
%   A = [2, 1; 1, -1];
%   b = [3; 0];
%   x = linear_solver(A, b);

    % Validate inputs
    [rows_A, cols_A] = size(A);
    if rows_A ~= cols_A
        error('Coefficient matrix A must be square');
    end
    
    if length(b) ~= rows_A
        error('Right-hand side vector b must have same number of rows as matrix A');
    end
    
    % Check for singular matrix
    det_A = det(A);
    if abs(det_A) < eps
        warning('Matrix is singular or nearly singular, using pseudoinverse');
        result = pinv(A) * b;
    else
        % Solve using left division (more efficient and accurate than inv(A)*b)
        result = A \ b;
    end
end