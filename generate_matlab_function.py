import random
import string
import os

# Генерация случайного имени файла, начинающегося с 'matlab_func_'
random_filename = "matlab_func_" + "".join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".m"

# Определение содержимого функции MATLAB
matlab_function_code = '''function result = calculateMean(inputArray)
% CALCULATMEAN Вычисляет среднее значение массива
%   INPUTARRAY: вектор или матрица чисел
%   RESULT: среднее значение элементов INPUTARRAY

    result = mean(inputArray);
end
'''

# Запись кода функции в файл
with open(random_filename, 'w') as f:
    f.write(matlab_function_code)

print(f"Функция MATLAB была сохранена в файл: {random_filename}")