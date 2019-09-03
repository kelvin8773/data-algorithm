# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}


def max_depth(root, depth=1)
  return 0 if root.nil?
  # return depth if root.left.nil? && root.right.nil?
 
  1 + [max_depth(root.left, depth+1), max_depth(root.right, depth+1)].max
  
end