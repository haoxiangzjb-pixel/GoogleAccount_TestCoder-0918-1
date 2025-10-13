import queue
import threading
import time

class Crystal:
    """
    A class to manage a queue with thread-safe operations.
    """

    def __init__(self, maxsize=0):
        """
        Initializes the Crystal queue.

        Args:
            maxsize (int, optional): Maximum size of the queue. 0 means infinite size.
        """
        self._queue = queue.Queue(maxsize=maxsize)
        self._lock = threading.Lock()

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.

        Args:
            item: The item to add.
        """
        self._queue.put(item)
        print(f"Enqueued: {item}")

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.
        Blocks if the queue is empty.

        Returns:
            The item removed from the front of the queue.
        """
        item = self._queue.get()
        print(f"Dequeued: {item}")
        return item

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.
        If the queue is empty, returns None.

        Returns:
            The item at the front, or None if empty.
        """
        with self._lock:
            if not self._queue.empty():
                # Access the internal queue safely under the lock
                # Create a temporary list to peek without modifying the original queue
                temp_list = list(self._queue.queue)
                return temp_list[0]
            else:
                return None

    def size(self):
        """
        Returns the current number of items in the queue.

        Returns:
            int: The size of the queue.
        """
        return self._queue.qsize()

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            bool: True if the queue is empty, False otherwise.
        """
        return self._queue.empty()

    def is_full(self):
        """
        Checks if the queue is full.

        Returns:
            bool: True if the queue is full, False otherwise.
        """
        return self._queue.full()


# Example usage
if __name__ == "__main__":
    crystal_queue = Crystal(maxsize=3)

    print("Is empty?", crystal_queue.is_empty())  # True

    crystal_queue.enqueue("Item 1")
    crystal_queue.enqueue("Item 2")
    crystal_queue.enqueue("Item 3")

    print("Size:", crystal_queue.size())  # 3
    print("Is full?", crystal_queue.is_full())  # True
    print("Peek:", crystal_queue.peek())  # Item 1

    crystal_queue.dequeue()  # Item 1
    crystal_queue.dequeue()  # Item 2

    print("Size after dequeues:", crystal_queue.size())  # 1
    print("Peek after dequeues:", crystal_queue.peek())  # Item 3
