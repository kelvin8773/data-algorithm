# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}

def remove_nth_from_end(head, n)
  size = 1
  left = right = head
  
  while right.next 
    size += 1
    right = right.next
    if size > n + 1
      left = left.next
    end
  end  
  return head.next if size == n
  
  left.next = left.next.next
  head 
end

head = ListNode.new(1)

p head

