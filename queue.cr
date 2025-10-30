# A simple queue implementation in Crystal
class CrystalQueue(T)
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
  def front : T?
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

  # Peek at the element at the given index without removing it
  def [](index : Int32) : T?
    @queue[index]?
  end

  # String representation of the queue
  def to_s : String
    @queue.to_s
  end
end

# Example usage
if __FILE__ == $0
  q = CrystalQueue(Int32).new
  q.enqueue(1)
  q.enqueue(2)
  q.enqueue(3)
  
  puts "Queue size: #{q.size}"
  puts "Front element: #{q.front}"
  puts "Dequeue element: #{q.dequeue}"
  puts "Queue after dequeue: #{q}"
  puts "Is empty: #{q.empty?}"
end