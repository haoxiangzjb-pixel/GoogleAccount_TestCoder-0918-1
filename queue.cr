class Queue
  def initialize
    @items = [] of Int32 | String | Float64 # Can store different types
  end

  # Add an item to the back of the queue
  def enqueue(item)
    @items << item
  end

  # Remove and return the front item from the queue
  def dequeue
    if empty?
      raise "Queue is empty"
    else
      @items.shift
    end
  end

  # Return the front item without removing it
  def front
    if empty?
      raise "Queue is empty"
    else
      @items.first
    end
  end

  # Check if the queue is empty
  def empty?
    @items.size == 0
  end

  # Return the size of the queue
  def size
    @items.size
  end

  # Display all items in the queue
  def display
    puts "Queue: [#{@items.join(", ")}]"
  end
end

# Example usage:
# queue = Queue.new
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue(3)
# queue.display # Output: Queue: [1, 2, 3]
# puts queue.dequeue # Output: 1
# puts queue.front # Output: 2
# puts queue.size # Output: 2