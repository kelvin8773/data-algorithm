# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}

def is_palindrome(head)
  list = []
  
  while !head.nil? do
    list << head.val
    head = head.next
  end
  
  list == list.reverse
  
end