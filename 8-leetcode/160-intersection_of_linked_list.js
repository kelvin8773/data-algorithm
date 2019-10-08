/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
  var len_a = getListSize(headA)
  var len_b = getListSize(headB)
  
  if (len_a > len_b) {
    temp = len_a - len_b
    while (temp > 0) {
      headA = headA.next;
      temp = temp - 1;
    }
  } else if (len_a < len_b) {
    temp = len_b - len_a
    while (temp >0) {
      headB = headB.next;
      temp = temp - 1;
    }
  }
   
   while (headA != null or headB != null) {
     if (headA == headB) {
       return headA
     };
     headA = headA.next;
     headB = headB.next;
   }
  
   return null
   
 };
 
 var getListSize = function(head) {
   var len = 0
   while (head != null ) {
     head = head.next
     len = len + 1
   }
   return len
 }
 