import queue

class Crystal:
    """
    A class to manage a queue.
    """

    def __init__(self):
        """
        Initializes the Crystal object with an empty queue.
        """
        self._queue = queue.Queue()

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self._queue.put(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item removed from the front of the queue, or None if the queue is empty.
        """
        if not self._queue.empty():
            return self._queue.get()
        else:
            return None

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            The size of the queue.
        """
        return self._queue.qsize()

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            True if the queue is empty, False otherwise.
        """
        return self._queue.empty()
