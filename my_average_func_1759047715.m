function avg = my_average(input_array)
    %MY_AVERAGE Вычисляет среднее значение входного вектора или массива.
    %   AVG = MY_AVERAGE(INPUT_ARRAY) возвращает среднее значение элементов
    %   входного вектора или массива INPUT_ARRAY.

    % Проверка на пустой массив
    if isempty(input_array)
        avg = NaN; % или 0, в зависимости от желаемого поведения
        return;
    end

    % Вычисление среднего значения
    avg = sum(input_array(:)) / numel(input_array);
end
