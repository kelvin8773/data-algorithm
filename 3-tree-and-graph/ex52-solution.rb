class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def search_tree?(array_tree)
  # write your code here
  tree = array_to_tree(array_tree, 0)
  
  in_order_array = in_order(tree)
  
  in_order_array == in_order_array.sort
end

def in_order(node)
  if node == nil
    return []
  end

  result = in_order(node.left)
  result << node.data
  result += in_order(node.right)
end

puts search_tree?([10, 4, 12])
# => true

puts search_tree?([10, 5, 7])
# => false