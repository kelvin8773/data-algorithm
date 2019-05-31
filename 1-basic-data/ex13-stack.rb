class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = Node.new(nil)
    @tail = Node.new(nil)
  end

  def isEmpty
    if @head&.value.nil?
      return true
    else
      return false
    end
  end

  def add(number)
    new_node = Node.new(number)

    if self.isEmpty
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end  
    puts "added #{number}."
    return number
  end

  def add_at(index, number)
    add_node = Node.new(number)  

    if self.isEmpty
      @head = add_node
      @tail = add_node
      if index != 0
        puts "index out of range, but #{number} is added."
      else
        puts "added #{number} at 0 position." 
      end
    elsif index == 0
      add_node.next_node = @head
      @head = add_node
      puts "added #{number} at 0 position." 
    else   
      pre_node = get_node(index-1)
      next_node = pre_node&.next_node
      pre_node.next_node = add_node
      add_node.next_node = next_node
      puts "added #{number} at #{index} position." 
    end
    return number 
  end	

  def remove(index) 
    if index == 0
      value = @head.value
      @head = @head&.next_node
      puts "removed #{value} at 0 position."
      return value
    end
      
    pre_node = get_node(index-1)
    value = pre_node&.next_node&.value
    pre_node&.next_node = pre_node&.next_node&.next_node

    if pre_node == @tail
      @tail = pre_node
    end

    puts "removed #{value} at #{index} position."
    return value
  end
      
  def get(index)
    node = get_node(index)
    if node.nil?
      return "index out of range"
    else
      node&.value
    end
  end

  private
  def get_node(index)
    node = @head
    while index > 0 && node
      node = node.next_node
      index -= 1
    end
    node
  end

end

class Stack
  def initialize
    @list = LinkedList.new
    @index = 0
  end

  def push(number)
    @list.add_at(@index, number)
    @index += 1
  end

  def pop
    if @list.isEmpty
      return -1
    else
      @index -= 1
      @list.remove(@index)
    end
  end

end

stack = Stack.new
stack.push(3)
stack.push(5)
# stack.push(2)
# stack.push(7)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)

puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3

puts stack.pop
# => -1

