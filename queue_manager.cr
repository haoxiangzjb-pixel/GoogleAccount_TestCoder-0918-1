# Crystal class for managing a queue
class QueueManager(T)
  def initialize
    @queue = [] of T
  end

  # Add an item to the end of the queue
  def enqueue(item : T)
    @queue << item
  end

  # Remove and return the first item from the queue
  def dequeue : T?
    @queue.shift
  end

  # Return the first item without removing it
  def peek : T?
    @queue.first?
  end

  # Check if the queue is empty
  def empty? : Bool
    @queue.empty?
  end

  # Get the size of the queue
  def size : Int32
    @queue.size
  end

  # Clear the queue
  def clear : Nil
    @queue.clear
  end

  # Convert queue to array
  def to_a : Array(T)
    @queue.dup
  end
end

# Example usage:
# queue = QueueManager(String).new
# queue.enqueue("first")
# queue.enqueue("second")
# puts queue.dequeue # => "first"
# puts queue.peek    # => "second"