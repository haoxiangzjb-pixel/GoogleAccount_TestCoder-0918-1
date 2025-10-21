# A Crystal class for managing a queue
class Crystal
  def initialize
    @queue = [] of String
  end

  # Add an item to the end of the queue
  def enqueue(item : String)
    @queue << item
  end

  # Remove and return the first item from the queue
  def dequeue : String?
    @queue.shift
  end

  # Check if the queue is empty
  def empty? : Bool
    @queue.empty?
  end

  # Get the size of the queue
  def size : Int32
    @queue.size
  end

  # Peek at the first item without removing it
  def peek : String?
    @queue.first?
  end

  # Display the current queue
  def display
    puts @queue.join(" -> ")
  end
end

# Example usage:
# queue = Crystal.new
# queue.enqueue("first")
# queue.enqueue("second")
# queue.enqueue("third")
# queue.display # Output: first -> second -> third
# puts queue.dequeue # Output: first
# puts queue.size # Output: 2