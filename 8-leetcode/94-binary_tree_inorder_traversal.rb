# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}

def inorder_traversal(root, res=[])
  return res if root.nil?
  
  inorder_traversal(root.left, res)
  
  res << root.val
  
  inorder_traversal(root.right, res)
  
end