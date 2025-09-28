function avg = mean_calc(vec)
% MEAN_CALC Вычисляет среднее значение вектора
%    AVG = MEAN_CALC(VEC) принимает вектор VEC и возвращает его среднее значение AVG.

    if isempty(vec)
        avg = NaN; % Возвращаем NaN, если вектор пуст
        return;
    end

    avg = sum(vec) / length(vec);

end