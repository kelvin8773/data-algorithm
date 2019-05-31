class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def pre_order(node)
  if node == nil
    return ''
  end
  result = "#{node.data} "
  result += pre_order(node.left)
  result += pre_order(node.right)
end

def build_btree(node, value)
  if node.data.nil?
    node.data = value
  end

  if node.data < value
    if node.right.nil?
      node.right = Node.new(value)
    end
    build_btree(node.right, value)
  end

  if node.data > value  
    if node.left.nil?
      node.left = Node.new(value)
    end
    build_btree(node.left, value)
  end
  
end


def binary_search_tree(array)
  node = Node.new(array[0])
  for value in array
    build_btree(node, value)
  end

  pre_order(node).strip
  
end

p binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"
