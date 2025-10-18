# Crystal class for managing a queue
class Crystal
  def initialize
    @queue = Array(String).new
  end

  # Add an element to the back of the queue
  def enqueue(element : String)
    @queue.push(element)
  end

  # Remove and return the front element of the queue
  def dequeue : String?
    @queue.shift
  end

  # Return the front element without removing it
  def peek : String?
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
  def clear
    @queue.clear
  end

  # Get a copy of the queue elements
  def to_a : Array(String)
    @queue.dup
  end
end

# Example usage:
queue = Crystal.new
queue.enqueue("first")
queue.enqueue("second")
queue.enqueue("third")

puts "Queue size: #{queue.size}"
puts "Front element: #{queue.peek}"
puts "Dequeued: #{queue.dequeue}"
puts "New front element: #{queue.peek}"
puts "Queue is empty: #{queue.empty?}"