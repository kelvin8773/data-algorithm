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

def balanced_tree?(tree_array) 
  tree = array_to_tree(tree_array)
  cal_tree_height(tree) - cal_tree_height_min(tree) < 2
end

def cal_tree_height(tree)
  return 0 if tree.nil? 
  1 + [cal_tree_height(tree.left), cal_tree_height(tree.right)].max
end

def cal_tree_height_min(tree)
  return 0 if tree.nil?
  1 + [cal_tree_height_min(tree.left), cal_tree_height_min(tree.right)].min
end



puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true

puts balanced_tree?([2, 7, 5, 2, 6, 0, 9, 0, 0, 5, 11, 4, 0])
# => false
