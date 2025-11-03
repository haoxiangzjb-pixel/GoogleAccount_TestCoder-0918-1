class CrystalQueue
  def initialize
    @queue = [] of Object
  end

  # Add an element to the back of the queue
  def enqueue(item)
    @queue << item
    self
  end

  # Remove and return the front element of the queue
  def dequeue
    if @queue.empty?
      raise "Queue is empty"
    else
      @queue.shift
    end
  end

  # Return the front element without removing it
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

  # Clear the queue
  def clear
    @queue.clear
  end

  # Convert queue to array
  def to_a
    @queue.clone
  end
end

# Example usage:
# queue = CrystalQueue.new
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue(3)
# puts queue.dequeue # => 1
# puts queue.peek    # => 2
# puts queue.size    # => 2