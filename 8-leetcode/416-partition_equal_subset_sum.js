/**
 * @param {number[]} nums
 * @return {boolean}
 */

var canPartition = function(nums) {
  const total = nums.reduce((a, b) => a + b, 0);

  if (total % 2 !== 0) {
    return false;
  }

  const helper = (nums, total, index = 0, sum = 0, results = new Map()) => {
    let current = index + "_" + sum;
    if (results.get(current) !== undefined) {
      return results.get(current);
    }
    if (sum * 2 === total) {
      return true;
    }
    if (sum > total / 2 || index >= nums.length) {
      return false;
    }

    let result =
      helper(nums, total, index + 1, sum + nums[index], results) ||
      helper(nums, total, index + 1, sum, results);
    results.set(current, result);
    return result;
  };

  return helper(nums, total);
};

const nums1 = [1, 5, 5, 11];
const nums2 = [1, 2, 3, 5];
const nums3 = [1, 2, 3, 4, 5, 6, 7];

console.log(canPartition(nums1));
console.log(canPartition(nums2));
console.log(canPartition(nums3));
