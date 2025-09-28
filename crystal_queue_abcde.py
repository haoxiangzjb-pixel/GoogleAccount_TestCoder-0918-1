import collections

class Crystal:
    """
    A class to manage a queue.
    """

    def __init__(self):
        self._queue = collections.deque()

    def add(self, item):
        """Add an item to the end of the queue."""
        self._queue.append(item)

    def remove(self):
        """Remove and return an item from the front of the queue."""
        if not self._queue:
            raise IndexError("Queue is empty")
        return self._queue.popleft()

    def peek(self):
        """Return the item at the front of the queue without removing it."""
        if not self._queue:
            raise IndexError("Queue is empty")
        return self._queue[0]

    def size(self):
        """Return the number of items in the queue."""
        return len(self._queue)

    def is_empty(self):
        """Check if the queue is empty."""
        return not self._queue
