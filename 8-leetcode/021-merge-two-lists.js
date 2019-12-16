/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var mergeTwoLists = (left, right) => {
  if (left && right) {
    if (left.val >= right.val) {
      let temp = left;
      left = right;
      right = temp;
    }
    left.next = mergeTwoLists(left.next, right);
  }
  return (left === null ? right : left)
}