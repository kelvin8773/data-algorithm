# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} [2, 4, 3]
# @param {ListNode} [5, 6, 4]
# @return {ListNode}

def add_two_numbers(l1, l2)
   result, add = [], 0
   x, y = l1.val, l2.val     
   until l1.nil? && l2.nil? && add == 0   
       sum = x + y + add       
       result << sum % 10 
       add = sum >= 10 ? 1 : 0
       l1 = l1.next if !l1.nil?
       l2 = l2.next if !l2.nil?
       x = l1.nil? ? 0 : l1.val
       y = l2.nil? ? 0 : l2.val       
   end      
    result
end

def array_to_linked_list(array)
  node = ListNode.new(array.last)
  (array.size - 2).downto(0) do |index|
    curr_node = ListNode.new(array[index])
    curr_node.next = node
    node = curr_node
  end
  node
end

list1 = [2, 4, 3]
list2 = [5, 6, 4]

l1 = array_to_linked_list(list1)
l2 = array_to_linked_list(list2)

p add_two_numbers(l1, l2)