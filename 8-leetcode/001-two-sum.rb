# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  comp = {}
  nums.each_with_index do |x, idx|
      return [comp[x], idx] if comp[x]       
      comp[target-x] = idx        
  end
end

p two_sum([3,2,7,11,15,4], 9)
# => [1, 2]


