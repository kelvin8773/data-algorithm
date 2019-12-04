/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */

var searchMatrix = function (matrix, target) {
  let row = matrix.length;
  if (row === 0) { return false };

  let col = matrix[0].length;
  let idxs = [];

  matrix.forEach((arr, index) => {
    if (arr[col - 1] >= target && arr[0] <= target) {
      idxs.push(index);
    }
  });

  for (let i of idxs) {
    if (matrix[i].find(value => value === target)) {
      return true
    }
  }

  return false;
};