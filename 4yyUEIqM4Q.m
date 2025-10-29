function result = mean_calc(data)
% MEAN_CALC computes the mean of the input data
% Input: data - vector or matrix of numeric values
% Output: result - mean value

    if isempty(data)
        error('Input data cannot be empty');
    end
    
    result = mean(data);
end