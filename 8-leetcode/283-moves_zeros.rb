# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

def move_zeroes(nums)
  zero_count = nums.count(0)
  nums.delete(0)
  nums.concat(Array.new(zero_count, 0))
end

p move_zeroes([0, 1, 0, 3, 12])
