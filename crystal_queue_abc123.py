"""
Модуль с реализацией класса Crystal для управления очередью.
"""

import random
import string
from collections import deque
from typing import Any, Optional


class Crystal:
    """
    Класс Crystal для управления очередью FIFO (First In, First Out).
    
    Атрибуты:
        _queue (deque): Внутреннее представление очереди.
        _name (str): Имя экземпляра очереди.
    """
    
    def __init__(self, name: Optional[str] = None):
        """
        Инициализирует экземпляр очереди Crystal.
        
        Args:
            name (str, optional): Имя очереди. Если не задано, генерируется случайное имя.
        """
        self._queue = deque()
        if name is None:
            # Генерируем случайное имя, если оно не предоставлено
            random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
            self._name = f"CrystalQueue_{random_suffix}"
        else:
            self._name = name
    
    def enqueue(self, item: Any) -> None:
        """
        Добавляет элемент в конец очереди.
        
        Args:
            item (Any): Элемент для добавления в очередь.
        """
        self._queue.append(item)
        print(f"[{self._name}] Элемент '{item}' добавлен в очередь.")
    
    def dequeue(self) -> Any:
        """
        Удаляет и возвращает элемент из начала очереди.
        
        Returns:
            Any: Элемент, удаленный из начала очереди.
            
        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError(f"[{self._name}] Невозможно удалить элемент из пустой очереди.")
        item = self._queue.popleft()
        print(f"[{self._name}] Элемент '{item}' удален из очереди.")
        return item
    
    def peek(self) -> Any:
        """
        Возвращает элемент из начала очереди без его удаления.
        
        Returns:
            Any: Элемент в начале очереди.
            
        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError(f"[{self._name}] Очередь пуста.")
        return self._queue[0]
    
    def is_empty(self) -> bool:
        """
        Проверяет, пуста ли очередь.
        
        Returns:
            bool: True, если очередь пуста, иначе False.
        """
        return len(self._queue) == 0
    
    def size(self) -> int:
        """
        Возвращает количество элементов в очереди.
        
        Returns:
            int: Количество элементов в очереди.
        """
        return len(self._queue)
    
    def clear(self) -> None:
        """
        Очищает очередь, удаляя все элементы.
        """
        self._queue.clear()
        print(f"[{self._name}] Очередь очищена.")
    
    def __str__(self) -> str:
        """
        Возвращает строковое представление очереди.
        
        Returns:
            str: Строковое представление очереди.
        """
        return f"[{self._name}] Очередь: {list(self._queue)}"
    
    def __repr__(self) -> str:
        """
        Возвращает официальное строковое представление объекта Crystal.
        
        Returns:
            str: Официальное строковое представление.
        """
        return f"Crystal(name='{self._name}', size={self.size()})"


# Пример использования
if __name__ == "__main__":
    # Создаем экземпляр очереди
    queue = Crystal("TestQueue")
    
    # Добавляем элементы
    queue.enqueue("Первый")
    queue.enqueue("Второй")
    queue.enqueue("Третий")
    
    # Печатаем состояние очереди
    print(queue)
    
    # Проверяем размер
    print(f"Размер очереди: {queue.size()}")
    
    # Просматриваем первый элемент
    print(f"Первый элемент: {queue.peek()}")
    
    # Удаляем элементы
    queue.dequeue()
    queue.dequeue()
    
    # Печатаем состояние очереди после удаления
    print(queue)
    
    # Проверяем, пуста ли очередь
    print(f"Очередь пуста: {queue.is_empty()}")
    
    # Очищаем очередь
    queue.clear()
    
    # Проверяем, пуста ли очередь после очистки
    print(f"Очередь пуста: {queue.is_empty()}")