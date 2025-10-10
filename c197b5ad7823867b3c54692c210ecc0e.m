function mean_val = compute_mean(arr)
    % Вычисляет среднее значение элементов массива
    mean_val = sum(arr(:)) / numel(arr);
end