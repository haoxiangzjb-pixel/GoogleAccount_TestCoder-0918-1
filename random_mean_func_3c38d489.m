function result = calculate_mean(data)
% This function calculates the mean of the input data
% Input: data - array or matrix of numbers
% Output: result - the mean value

    if isempty(data)
        error('Input data is empty');
    end
    
    result = sum(data(:)) / numel(data);
end