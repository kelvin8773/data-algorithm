# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}

def diameter_of_binary_tree(root)
  return 0 if root.nil?
 def height_of_btree(tree, height=0)
   return height if tree.nil?
   [height_of_btree(tree.left, height+1), height_of_btree(tree.right, height+1)].max
 end
 temp = height_of_btree(root.left) + height_of_btree(root.right)
 [diameter_of_binary_tree(root.left), diameter_of_binary_tree(root.right), temp].max  
     
end