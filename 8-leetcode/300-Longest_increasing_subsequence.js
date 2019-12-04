/**
 * @param {number[]} nums
 * @return {number}
 */
var lengthOfLIS = function (nums) {

  if (nums.length === 0) { return 0 };
  var lens = Array(nums.length).fill(1);

  for (let i = 1; i < nums.length; i++) {
    for (let j = 0; j < i; j++) {
      if (nums[j] < nums[i]) {
        lens[i] = Math.max(lens[j] + 1, lens[i]);
      }
    }
  }

  return Math.max(...lens);
};

