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


def rob(root)
  return 0 if root.nil?
  
  def helper(node)
    return [0, 0] if node.nil?
    left = helper(node.left)
    right = helper(node.right)
    robbed = node.val + left.last + right.last
    not_rob = left.max + right.max
    [robbed, not_rob]
  end
  rob_sums = helper(root)
  rob_sums.max
end

