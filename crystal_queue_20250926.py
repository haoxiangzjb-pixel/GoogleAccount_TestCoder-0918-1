import queue
import threading
import time

class Crystal:
    """
    Класс Crystal для управления очередью.
    Предоставляет методы для добавления, извлечения и проверки размера очереди.
    Потокобезопасен.
    """

    def __init__(self):
        """
        Инициализирует новую пустую очередь и блокировку для потокобезопасности.
        """
        self._queue = queue.Queue()
        self._lock = threading.Lock()

    def add(self, item):
        """
        Добавляет элемент в конец очереди.

        :param item: Элемент для добавления.
        """
        with self._lock:
            self._queue.put(item)
            print(f"Элемент '{item}' добавлен в очередь.")

    def get(self):
        """
        Извлекает и возвращает элемент из начала очереди.
        Если очередь пуста, возвращает None.

        :return: Элемент из очереди или None.
        """
        with self._lock:
            if not self._queue.empty():
                item = self._queue.get()
                print(f"Элемент '{item}' извлечен из очереди.")
                return item
            else:
                print("Очередь пуста, невозможно извлечь элемент.")
                return None

    def size(self):
        """
        Возвращает текущий размер очереди.

        :return: Количество элементов в очереди.
        """
        with self._lock:
            size = self._queue.qsize()
            print(f"Текущий размер очереди: {size}")
            return size

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.

        :return: True, если очередь пуста, иначе False.
        """
        with self._lock:
            is_empty = self._queue.empty()
            print(f"Очередь пуста: {is_empty}")
            return is_empty


# Пример использования
if __name__ == "__main__":
    crystal_queue = Crystal()

    # Добавление элементов
    crystal_queue.add("first")
    crystal_queue.add("second")
    crystal_queue.add("third")

    # Проверка размера
    crystal_queue.size()

    # Извлечение элементов
    crystal_queue.get()
    crystal_queue.get()

    # Проверка размера снова
    crystal_queue.size()

    # Извлечение последнего элемента
    crystal_queue.get()

    # Проверка на пустоту
    crystal_queue.is_empty()
    crystal_queue.get()  # Попытка извлечения из пустой очереди
