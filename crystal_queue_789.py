import queue
import pickle
import os

class Crystal:
    """
    A class to manage a queue with save/load functionality.
    """

    def __init__(self):
        """
        Initializes the Crystal instance with an empty queue.
        """
        self._queue = queue.Queue()

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.
        """
        self._queue.put(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.
        Raises queue.Empty if the queue is empty.
        """
        if self._queue.empty():
            raise queue.Empty("Queue is empty")
        return self._queue.get()

    def is_empty(self):
        """
        Checks if the queue is empty.
        """
        return self._queue.empty()

    def size(self):
        """
        Returns the number of items in the queue.
        """
        return self._queue.qsize()

    def save(self, filepath):
        """
        Saves the current state of the queue to a file using pickle.
        """
        items = []
        while not self._queue.empty():
            items.append(self._queue.get())
        # Restore the queue
        for item in items:
            self._queue.put(item)

        with open(filepath, 'wb') as f:
            pickle.dump(items, f)

    def load(self, filepath):
        """
        Loads the state of the queue from a file using pickle.
        """
        if not os.path.exists(filepath):
            raise FileNotFoundError(f"File {filepath} not found.")
        with open(filepath, 'rb') as f:
            items = pickle.load(f)

        # Clear current queue and load new items
        self._queue.queue.clear()
        for item in items:
            self._queue.put(item)
