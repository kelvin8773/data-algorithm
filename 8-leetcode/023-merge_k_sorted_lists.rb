# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}

def merge_two_lists(l1, l2)
  dummy = curr = ListNode.new(nil)

  while l1 || l2
      if (l1 && l2 && l1.val < l2.val) || !l2
          curr.next, l1 = l1, l1.next
      elsif (l1 && l2) || !l1
          curr.next, l2 = l2, l2.next
      end
      curr = curr.next
  end

  dummy.next
end

def merge_k_lists(lists)
amount = lists.size
interval = 1

while interval < amount
  (0..amount-interval).step(interval*2) do |i|
    lists[i] = merge_two_lists(lists[i], lists[i+interval])   
  end
  interval *= 2
end 
amount > 0 ? lists[0] : lists

end