class Stack
  def initialize
    @stack = []
  end
  
  def push(number)
    @stack << number
  end
  
  def pop
    @stack.pop
  end
  
  def min
    @stack.min
  end

  def empty
    @stack.length == 0
  end

  def length
    @stack.length
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
stack.push(7)
stack.push(3)
stack.push(5)
# stack.push(1)
# stack.push(9)

puts stack.min
# => 2

stack.pop
stack.pop
stack.pop
p stack.empty
p stack.length

stack.pop
stack.pop
stack.pop


p stack.empty
# puts stack.min
# => 3