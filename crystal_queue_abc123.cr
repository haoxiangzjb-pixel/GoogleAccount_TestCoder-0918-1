# Crystal class for managing a queue
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

  # Return the first item without removing it
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

  # Display the current queue
  def display
    puts @queue.join(" -> ")
  end
end

# Example usage
queue_manager = Crystal.new

queue_manager.enqueue("First")
queue_manager.enqueue("Second")
queue_manager.enqueue("Third")

puts "Current queue:"
queue_manager.display

puts "Dequeued: #{queue_manager.dequeue}"
puts "Current queue after dequeue:"
queue_manager.display

puts "Peek: #{queue_manager.peek}"
puts "Size: #{queue_manager.size}"