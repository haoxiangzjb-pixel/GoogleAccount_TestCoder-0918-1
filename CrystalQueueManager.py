import secrets
import string


class Crystal:
    """
    A class to manage a queue data structure.
    """

    def __init__(self):
        """
        Initializes an empty queue.
        """
        self._items = []

    def enqueue(self, item):
        """
        Adds an item to the end of the queue.

        :param item: The item to be added to the queue.
        """
        self._items.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        :return: The item removed from the front of the queue.
        :raises IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("dequeue from an empty queue")
        return self._items.pop(0)

    def is_empty(self):
        """
        Checks if the queue is empty.

        :return: True if the queue is empty, False otherwise.
        """
        return len(self._items) == 0

    def size(self):
        """
        Returns the number of items in the queue.

        :return: The number of items in the queue.
        """
        return len(self._items)

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        :return: The item at the front of the queue.
        :raises IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("peek from an empty queue")
        return self._items[0]

    def __str__(self):
        """
        Returns a string representation of the queue.

        :return: A string representation of the queue.
        """
        return f"Crystal Queue({self._items})"


def _generate_random_filename():
    """
    Generates a random filename.

    :return: A string representing a random filename.
    """
    # Generate a random string of 10 characters
    random_string = ''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(10))
    return f"{random_string}.py"


# Example usage and saving to a file with a random name
if __name__ == "__main__":
    # Create an instance of Crystal
    q = Crystal()
    
    # Enqueue some items
    q.enqueue("Item 1")
    q.enqueue("Item 2")
    q.enqueue("Item 3")
    
    print(f"Queue after enqueuing: {q}")
    print(f"Front item (peek): {q.peek()}")
    print(f"Queue size: {q.size()}")
    
    # Dequeue an item
    dequeued_item = q.dequeue()
    print(f"Dequeued item: {dequeued_item}")
    print(f"Queue after dequeuing: {q}")
    print(f"Is queue empty? {q.is_empty()}")
    
    # Generate a random filename and save the class definition to it
    filename = _generate_random_filename()
    print(f"\nSaving class definition to: {filename}")
    
    # Read the current file content (this script) and extract the Crystal class definition
    # This is a simple way to save the class itself.
    # In a real-world scenario, you might want to save only the class definition.
    # For simplicity, we'll save the entire script.
    with open(__file__, 'r') as source_file:
        content = source_file.read()
        
    with open(filename, 'w') as dest_file:
        dest_file.write(content)
        
    print("Class saved successfully!")