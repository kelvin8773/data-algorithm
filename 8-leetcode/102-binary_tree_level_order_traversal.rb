# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}

def level_order(root, res=[], level=0)
  return [] if root.nil?

  if res[level]
   res[level] << root.val
  else
   res[level] = [root.val]
  end

  level_order(root.left, res, level+1)
  level_order(root.right, res, level+1)

  res
  
end