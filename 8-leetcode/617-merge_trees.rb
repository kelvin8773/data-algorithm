# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} t1
# @param {TreeNode} t2
# @return {TreeNode}

def merge_trees(t1, t2)
  return t2 if t1.nil?
  return t1 if t2.nil?
  
  merge_tree = TreeNode.new(t1.val + t2.val)
  pointer = merge_tree
  
  pointer.left = merge_trees(t1.left, t2.left)
  pointer.right = merge_trees(t1.right, t2.right)
  
  merge_tree
end

def make_tree_node(arr)
  node = TreeNode.new(arr[0])
  pointer = node
  i = 1

  while i < arr.size
    pointer.left = TreeNode.new(arr[i])
    pointer.right = TreeNode.new(arr[i+1]) 

    i % 2 != 0 ? (pointer = pointer.left) : (pointer = pointer.right)
    i += 2
  end

  node

end

arr1 = [1, 3, 2, 5]
arr2 = [2,1,3,nil,4,nil,7]

t1 = make_tree_node(arr1)
t2 = make_tree_node(arr2)

# p t1
p t2


p merge_trees(t1, t2)




  


