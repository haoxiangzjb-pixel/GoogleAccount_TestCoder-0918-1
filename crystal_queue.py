import uuid
import os

class Crystal:
    """
    Класс Crystal для управления очередью (FIFO).
    """

    def __init__(self):
        """Инициализирует пустую очередь."""
        self._queue = []

    def enqueue(self, item):
        """
        Добавляет элемент в конец очереди.

        Args:
            item: Элемент для добавления в очередь.
        """
        self._queue.append(item)

    def dequeue(self):
        """
        Удаляет и возвращает элемент из начала очереди.

        Returns:
            Элемент из начала очереди.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно извлечь элемент из пустой очереди.")
        return self._queue.pop(0)

    def peek(self):
        """
        Возвращает элемент из начала очереди, не удаляя его.

        Returns:
            Элемент из начала очереди.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно посмотреть элемент в пустой очереди.")
        return self._queue[0]

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.

        Returns:
            bool: True, если очередь пуста, иначе False.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Возвращает количество элементов в очереди.

        Returns:
            int: Количество элементов в очереди.
        """
        return len(self._queue)

    def __str__(self):
        """
        Возвращает строковое представление очереди.

        Returns:
            str: Строковое представление очереди.
        """
        return f"Crystal Queue: {self._queue}"


def save_class_to_random_file():
    """
    Сохраняет определение класса Crystal в файл с случайным именем.
    """
    # Генерируем случайное имя файла
    random_filename = f"crystal_class_{uuid.uuid4().hex}.py"
    
    # Получаем содержимое текущего файла (который должен содержать этот скрипт)
    current_file_path = os.path.abspath(__file__)
    with open(current_file_path, 'r', encoding='utf-8') as source_file:
        content = source_file.read()
    
    # Записываем содержимое в новый файл
    with open(random_filename, 'w', encoding='utf-8') as new_file:
        # Записываем только определение класса, без функции save_class_to_random_file
        # Для простоты запишем всё содержимое, но в реальном случае можно было бы
        # извлечь только класс.
        new_file.write(content)
    
    print(f"Класс Crystal сохранен в файл: {random_filename}")
    return random_filename

# Пример использования класса
if __name__ == "__main__":
    # Создаем очередь
    q = Crystal()
    
    # Добавляем элементы
    q.enqueue("Первый")
    q.enqueue("Второй")
    q.enqueue("Третий")
    
    print(q)  # Вывод: Crystal Queue: ['Первый', 'Второй', 'Третий']
    
    # Смотрим первый элемент
    print(f"Первый элемент: {q.peek()}")  # Вывод: Первый элемент: Первый
    
    # Извлекаем элементы
    print(f"Извлечен: {q.dequeue()}")  # Вывод: Извлечен: Первый
    print(f"Извлечен: {q.dequeue()}")  # Вывод: Извлечен: Второй
    
    print(q)  # Вывод: Crystal Queue: ['Третий']
    
    # Проверяем размер
    print(f"Размер очереди: {q.size()}")  # Вывод: Размер очереди: 1
    
    # Сохраняем класс в файл с случайным именем
    # save_class_to_random_file() # Раскомментируйте для использования