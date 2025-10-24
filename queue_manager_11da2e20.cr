# Crystal class for managing a queue
class Crystal
  def initialize
    @queue = [] of Int32 | String | Float64 # Can store different types
  end

  # Add an item to the end of the queue
  def enqueue(item)
    @queue.push(item)
  end

  # Remove and return the first item from the queue
  def dequeue
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.shift
    end
  end

  # Return the first item without removing it
  def peek
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.first
    end
  end

  # Check if the queue is empty
  def empty?
    @queue.empty?
  end

  # Return the size of the queue
  def size
    @queue.size
  end

  # Display all items in the queue
  def display
    @queue
  end
end

# Example usage:
# queue = Crystal.new
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue("hello")
# puts queue.dequeue # => 1
# puts queue.peek    # => 2
# puts queue.size    # => 2