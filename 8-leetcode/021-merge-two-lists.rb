# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def merge_two_lists(l1, l2)    
  if l1 && l2
    if l1.val >= l2.val
      l1, l2 = l2, l1
    end
      l1.next = merge_two_lists(l1.next, l2)
  end
  l1.nil? ? l2 : l1
end