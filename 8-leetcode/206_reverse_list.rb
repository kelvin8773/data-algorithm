# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

# @param {ListNode} head
# @return {ListNode}

def reverse_list(head)
  stack = []
  until head.nil?
    stack << head.val
    head=head.next
  end
  reverse = ListNode.new(stack.pop)
  point = reverse
  until stack.empty?
    point.next = ListNode.new(stack.pop)
    point = point.next
  end
  reverse
end
