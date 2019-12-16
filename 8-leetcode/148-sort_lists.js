/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */

/**
*      4   2   1   3
* pre      ^  
* slow         ^
* fast              ^
*
*/

var sortList = function (head) {
  const merge = (left, right) => {
    if (left && right) {
      if (left.val >= right.val) {
        let temp = left;
        left = right;
        right = temp;
      }
      left.next = merge(left.next, right);
    }
    return (left === null ? right : left)
  };

  if (head === null || head.next === null) return head;

  let pre = null, slow = head, fast = head;

  while (fast && fast.next) {
    pre = slow;
    slow = slow.next;
    fast = fast.next.next;
  }
  pre.next = null;
  let left = sortList(head);
  let right = sortList(slow);

  return merge(left, right);
};