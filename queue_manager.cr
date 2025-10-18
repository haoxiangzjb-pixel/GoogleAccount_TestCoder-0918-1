class Crystal
  def initialize
    @queue = [] of Object
  end

  # Add an element to the back of the queue
  def enqueue(element)
    @queue << element
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

  # Get the size of the queue
  def size
    @queue.size
  end

  # Display the queue contents
  def display
    puts "Queue: #{@queue.inspect}"
  end
end

# Example usage:
# queue = Crystal.new
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue(3)
# queue.display
# puts "Dequeued: #{queue.dequeue}"
# queue.display
# puts "Peek: #{queue.peek}"
# puts "Size: #{queue.size}"