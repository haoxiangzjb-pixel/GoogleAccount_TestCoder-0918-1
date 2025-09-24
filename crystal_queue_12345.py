import queue
import json


class Crystal:
    """
    A class to manage a queue and save/load its state to/from a JSON file.
    """

    def __init__(self):
        """
        Initializes the Crystal object with an empty queue.
        """
        self._queue = queue.Queue()

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.

        :param item: The item to add.
        """
        self._queue.put(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        :return: The item removed from the front of the queue.
        :raises queue.Empty: If the queue is empty.
        """
        if self._queue.empty():
            raise queue.Empty("Queue is empty")
        return self._queue.get()

    def is_empty(self):
        """
        Checks if the queue is empty.

        :return: True if the queue is empty, False otherwise.
        """
        return self._queue.empty()

    def size(self):
        """
        Gets the number of items in the queue.

        :return: The number of items in the queue.
        """
        return self._queue.qsize()

    def save_to_file(self, filename):
        """
        Saves the current state of the queue to a JSON file.

        :param filename: The name of the file to save to.
        """
        items = []
        # Copy items from the queue without removing them permanently
        temp_queue = queue.Queue()
        while not self._queue.empty():
            item = self._queue.get()
            items.append(item)
            temp_queue.put(item)

        # Restore the original queue
        while not temp_queue.empty():
            self._queue.put(temp_queue.get())

        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(items, f)

    def load_from_file(self, filename):
        """
        Loads the state of the queue from a JSON file, replacing the current contents.

        :param filename: The name of the file to load from.
        """
        with open(filename, 'r', encoding='utf-8') as f:
            items = json.load(f)

        self._queue = queue.Queue()
        for item in items:
            self._queue.put(item)
