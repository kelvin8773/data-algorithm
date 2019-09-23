# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}

def is_symmetric(root)
  return true if root.nil? 
      
  def check_value(left, right)
    return true if left.nil? && right.nil?
    return false if left.nil? || right.nil? || left.val != right.val   
    check_value(left.left, right.right) && check_value(left.right, right.left)
  end

check_value(root.left, root.right)
  
end