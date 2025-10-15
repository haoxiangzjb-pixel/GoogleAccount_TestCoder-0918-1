import struct
import random
import string

# Определяем структуру точки
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

# Создаем экземпляр точки
point = Point(3.14, 2.71)

# Генерируем случайное имя файла
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.dat'

# Сохраняем точку в бинарном формате в файл
with open(random_name, 'wb') as f:
    # Упаковываем два числа с плавающей точкой двойной точности (f64)
    f.write(struct.pack('dd', point.x, point.y))

print(f"Точка сохранена в файл: {random_name}")
print(f"Координаты точки: x = {point.x}, y = {point.y}")