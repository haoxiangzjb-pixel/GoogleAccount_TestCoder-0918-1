function avg = calculateMean(vec)
% CALCULATEMEAN Computes the mean of a vector
%   AVG = CALCULATEMEAN(VEC) returns the mean value of the input vector VEC.

    if isempty(vec)
        avg = NaN; % Return NaN if the input vector is empty
        return;
    end

    avg = sum(vec) / length(vec);

end
