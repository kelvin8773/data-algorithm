# Start with your code from last challenge.
class Node
	#your node code here
	attr_accessor :value, :next_node

	def initialize(value, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

class LinkedList
  def add(number)
  	new_node = Node.new(number)

  	if @head.nil?
	  	@head = new_node
		  @tail = new_node
	  else
		  @tail.next_node = new_node
		  @tail = new_node
	  end
  end

  def add_at(index, number)
  	new_node = Node.new(number)

  	if @head.nil?
	  	@head = new_node
		  @tail = new_node
	  elsif index == 0
		  new_node.next_node = @head
		  @head = new_node
	  else
		  previous_node = get_node(index - 1)
		  next_node = previous_node&.next_node
		  previous_node.next_node = new_node
		  new_node.next_node = next_node
	  end
  end
  
  def get(index)
  	node = get_node(index)
  	
		node&.value
		
  end
  
  def remove(index)
  	if index == 0
		  value = @head.value
  		@head = @head&.next_node
  		return value
  	end
  	
  	previous_node = get_node(index - 1)
  	value = previous_node.next_node.value
  	previous_node.next_node = previous_node&.next_node&.next_node

  	if previous_node == @tail
  		@tail = previous_node
  	end
  	
  	value
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



###############################
# Test for Linkedlist 
# LinkedList start from zero
###############################

list = LinkedList.new

##### Test Case for LinkedList ##############
list.add_at(10,9)

list.add(8) 
list.add(3)
list.add_at(1, 5) 
list.add_at(2, 4)
list.remove(1) 
# list.remove(0)
# list.remove(0)
# list.remove(0)

puts list.get(0)
puts list.get(1)
puts list.get(2)
puts list.get(3)
# puts list.get(4)
