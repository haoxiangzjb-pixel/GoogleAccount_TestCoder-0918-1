"""
A class to manage a queue of items, representing a Crystal.
Items can be added to the end of the queue (enqueue) and
removed from the front of the queue (dequeue).
"""

class Crystal:
    def __init__(self):
        """Initializes the Crystal with an empty list to store items."""
        self._queue = []

    def enqueue(self, item):
        """
        Adds an item to the end of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self._queue.append(item)
        print(f"Added {item} to the queue.")

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item removed from the front of the queue, or None if the queue is empty.
        """
        if not self._queue:
            print("Queue is empty. Cannot dequeue.")
            return None
        item = self._queue.pop(0)
        print(f"Removed {item} from the queue.")
        return item

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        Returns:
            The item at the front of the queue, or None if the queue is empty.
        """
        if not self._queue:
            print("Queue is empty. Nothing to peek.")
            return None
        item = self._queue[0]
        print(f"Front item is {item}.")
        return item

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            The integer size of the queue.
        """
        count = len(self._queue)
        print(f"Queue size is {count}.")
        return count

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            True if the queue is empty, False otherwise.
        """
        empty = len(self._queue) == 0
        print(f"Queue is empty: {empty}")
        return empty


# Example usage:
if __name__ == "__main__":
    crystal = Crystal()
    crystal.enqueue("Energy")
    crystal.enqueue("Light")
    crystal.is_empty()
    crystal.size()
    crystal.peek()
    crystal.dequeue()
    crystal.peek()
    crystal.size()
    crystal.dequeue()
    crystal.dequeue() # Attempt to dequeue from empty queue
    crystal.is_empty()