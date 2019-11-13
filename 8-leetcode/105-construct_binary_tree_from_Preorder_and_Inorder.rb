# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}

def build_tree(preorder, inorder, tree=TreeNode.new(preorder.first))
    return if preorder.size == 0
    
    if preorder.size == 1
      tree.val = preorder.first
      return tree
    end
    
    idx_of_inorder = inorder.index(preorder.first)
    left_inorder = inorder[0...idx_of_inorder]
    right_inorder = inorder[idx_of_inorder+1..-1] 
    
    left_preorder = preorder[1...left_inorder.size+1]
    right_preorder = preorder[left_inorder.size+1..-1]
    
    tree.left = build_tree(left_preorder, left_inorder)
    tree.right = build_tree(right_preorder, right_inorder)
    
    tree
end