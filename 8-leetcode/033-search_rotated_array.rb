# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

def search(nums, target)
  nums.each_with_index do |x, i|
    return i if x == target
  end
  -1
end