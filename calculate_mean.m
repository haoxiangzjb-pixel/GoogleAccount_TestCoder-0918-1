function mean_val = calculate_mean(vec)
% CALCULATE_MEAN Вычисляет среднее значение вектора
%    mean_val = CALCULATE_MEAN(vec) возвращает среднее значение элементов
%    в числовом векторе vec. Вектор vec должен быть одномерным.

    if ~isvector(vec)
        error('Входной аргумент должен быть вектором.');
    end
    
    % Вычисляем и возвращаем среднее значение
    mean_val = sum(vec) / length(vec);
end