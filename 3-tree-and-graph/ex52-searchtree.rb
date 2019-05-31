class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
      @data = data
  end
end

def array_to_tree(array, i=0)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)
  node
end

def search_tree?(tree_array)
  
  tree = array_to_tree(tree_array)
  
  def helper?(tree, min=-1, max=9999)
    return true if tree.nil?
    return false if tree.data < min || tree.data > max  
    return helper?(tree.left, min, tree.data) && helper?(tree.right, tree.data, max)
  end 

  helper?(tree)

end

puts search_tree?([20, 10, 27, 12, 14, 23, 30])
# => false

puts search_tree?([19, 9, 26, 4, 13, 17, 29])
# => false

puts search_tree?([20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0])
# => false

puts search_tree?([21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0])
# true

puts search_tree?([10, 4, 12])
# # => true

puts search_tree?([10, 5, 7])
# # => false

puts search_tree?([2, 7, 5, 2, 6, 0, 9, 12])
# => false