require_relative 'node'
# LinkedList class
# Initialize using nil head and nil tail
# Index is used to access the index
class LinkedList
  def initialize
    @head = nil
  end

  def tail
    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end
  
  def head
    @head
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  def size
    node = @head
    count = 0
    unless node.nil?
      loop do
        count += 1
        break if node.next_node.nil?

        node = node.next_node
      end
    end
    count
  end

  def prepend(value)
    prev_head = @head
    @head = Node.new(value, prev_head)
  end

  def to_s
    node = @head
    result = ''
    unless node.nil?
      loop do
        break if node.nil?

        result.concat("(#{node.value}) -> ")
        node = node.next_node
      end
      result.concat('nil')
    end
    result
  end

  def at(index)
    return 'index greater than size' if size < index

    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def find(value)
    node = @head
    index = 0
    until node.nil?
      return index if node.value == value

      node = node.next_node
      index += 1
    end
    nil
  end

  def contains?(value)
    find(value) ? true : false
  end

  def pop
    @head = nil if size == 1
    node = @head
    node = node.next_node until node.next_node == tail
    node.next_node = nil
    node 
  end
end
