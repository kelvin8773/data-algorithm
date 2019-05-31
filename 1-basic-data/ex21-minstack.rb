class Node
  attr_accessor :value, :previous_node, :next_node

  def initialize(value, previous_node=nil, next_node=nil)
      @value = value
      @previous_node = previous_node
      @next_node = next_node
  end
end

class Stack
  def initialize()
    @tail = Node.new(nil)
  end

  def push(number)
    this_node = Node.new(number)
    
    if @tail == nil
      @tail = this_node
      return "this stack is empty!"
    else
      @tail.next_node = this_node
      this_node.previous_node = @tail
      @tail = this_node
      return "number is added to the tail!"
    end

  end

  def pop
    if @tail == nil
      return "this stack is empty!"
    else
      pop_node = @tail
      @tail = @tail.previous_node
      @tail.next_node = nil
      return pop_node.value
    end
  end

  def min
    min = @tail.value
    node = @tail

    while node
      if node&.value != nil &&min > node&.value 
        min = node.value
      end
      node = node.previous_node
    end
    return min
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.min
# => 3

stack.pop
stack.push(7)
puts stack.min
# => 3

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3

