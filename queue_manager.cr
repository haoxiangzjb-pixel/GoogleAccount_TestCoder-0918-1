# Crystal class for managing a queue
class QueueManager(T)
  def initialize
    @queue = [] of T
  end

  # Add an element to the back of the queue
  def enqueue(element : T)
    @queue << element
  end

  # Remove and return the front element of the queue
  def dequeue : T?
    @queue.shift
  end

  # Return the front element without removing it
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

  # Convert the queue to a string representation
  def to_s : String
    @queue.to_s
  end
end

# Example usage
puts "Creating a queue manager for integers..."
queue = QueueManager(Int32).new

puts "Adding elements to the queue..."
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

puts "Queue size: #{queue.size}"
puts "Front element: #{queue.peek}"
puts "Queue contents: #{queue}"

puts "Dequeueing elements..."
while !queue.empty?
  element = queue.dequeue
  puts "Dequeued: #{element}"
end

puts "Queue is empty: #{queue.empty?}"