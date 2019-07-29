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
  return l2 if l1.nil?
  return l1 if l2.nil?
  
  start = ListNode.new(-1)
  pointer = start
  
  while l1 && l2 do
    if l1.val <= l2.val  
      pointer.next = ListNode.new(l1.val)
      l1 = l1.next
      pointer = pointer.next
    elsif l2.val <= l1.val
      pointer.next = ListNode.new(l2.val)
      l2 = l2.next
      pointer = pointer.next
    end
  end
  
  pointer.next = l1 if !l1.nil?
  pointer.next = l2 if !l2.nil?
  
  start.next
  
end