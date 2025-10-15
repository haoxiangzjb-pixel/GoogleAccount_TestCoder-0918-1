function result = calculateMean(inputArray)
    % Вычисляет среднее значение элементов массива
    if isempty(inputArray)
        result = NaN; % Возвращаем NaN, если массив пуст
    else
        result = sum(inputArray(:)) / numel(inputArray);
    end
end