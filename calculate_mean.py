#!/usr/bin/env python3
"""
Скрипт для вычисления среднего значения и сохранения его в файл с псевдослучайным именем.
"""

import numpy as np
import time

def calculate_mean_and_save(data, prefix="mean_result_"):
    """
    Вычисляет среднее значение массива данных и сохраняет его в файл с уникальным именем.

    Args:
        data: Список или массив numpy, содержащий числовые данные.
        prefix: Префикс для имени файла (по умолчанию 'mean_result_').

    Returns:
        str: Имя созданного файла.
    """
    mean_value = np.mean(data)
    # Генерация уникального имени файла на основе текущего времени
    timestamp = str(int(time.time()))
    filename = f"{prefix}{timestamp}.txt"
    with open(filename, 'w') as f:
        f.write(f"Среднее значение: {mean_value}\n")
    print(f"Среднее значение {mean_value} сохранено в {filename}")
    return filename

# Пример использования
if __name__ == "__main__":
    sample_data = [1, 2, 3, 4, 5]
    output_file = calculate_mean_and_save(sample_data)