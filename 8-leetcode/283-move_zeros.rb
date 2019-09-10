# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

def move_zeroes_r(nums)
  zero_count = nums.count(0)
  nums.delete(0)
  nums.concat(Array.new(zero_count, 0))
end

def move_zeroes(nums)
  index = 0
  zero_count = nums.count(0)
  while index < nums.size - zero_count
    if nums[index].zero?
      swap_idx = index + 1
      swap_idx += 1 while swap_idx < nums.size && nums[swap_idx].zero?
      nums[index], nums[swap_idx] = nums[swap_idx], nums[index]
    end
    index += 1
  end
  nums
end

p move_zeroes([0, 1, 0, 3, 12])
