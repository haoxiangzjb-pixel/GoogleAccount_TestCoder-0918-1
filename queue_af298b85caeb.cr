# Crystal class for managing a queue
class Crystal
  @queue : Array(String | Int32 | Float32 | Bool)

  def initialize
    @queue = [] of String | Int32 | Float32 | Bool
  end

  # Add an element to the back of the queue
  def enqueue(element)
    @queue << element
  end

  # Remove and return the front element of the queue
  def dequeue
    if @queue.empty?
      raise "Queue is empty"
    end
    @queue.shift
  end

  # Return the front element without removing it
  def front
    if @queue.empty?
      raise "Queue is empty"
    end
    @queue.first
  end

  # Check if the queue is empty
  def empty?
    @queue.empty?
  end

  # Return the size of the queue
  def size
    @queue.size
  end

  # Clear the queue
  def clear
    @queue.clear
  end

  # Display all elements in the queue
  def display
    puts @queue.inspect
  end
end

# Example usage:
# queue = Crystal.new
# queue.enqueue("first")
# queue.enqueue("second")
# queue.enqueue(3)
# queue.display
# puts queue.dequeue
# puts queue.size