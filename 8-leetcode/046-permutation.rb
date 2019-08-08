require 'benchmark/ips'

# @param {Integer[]} nums
# @return {Integer[][]}

# trick from Ruby
def permute_r(nums)
  nums.permutation(nums.size).to_a  
end

# self
def permute(nums, combination=[], result=[])
  if nums.size <= 1
    return result << combination + nums
  end

  nums.each_with_index do |x, i|
    nums.delete_at(i)
    combination << x
    permute(nums, combination, result) 
    combination.pop
    nums.insert(i, x)
  end

  result
end

# p permute([1, 2, 3])

# p permute([1])

# p permute([1, 2, 3, 4, 6, 7])

nums1 = [1, 2, 3]
nums2 = [1, 2, 3, 4]
nums3 = [1, 2, 3, 4, 5]
nums4 = [1, 2, 3, 4, 5, 6]
nums5 = [1, 2, 3, 4, 5, 6, 7]
nums6 = [1, 2, 3, 4, 5, 6, 7, 8]
nums7 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

all_nums = [nums1, nums2, nums3, nums4, nums5, nums6, nums7]

all_nums.each do |nums|
  p "Benchmark test with #{nums}"

  Benchmark.ips do |x|
    x.config(:time => 3, :warmup => 2)
    
    x.report("Kelvin's Method") {permute(nums)}
    x.report("Ruby's Method") {permute_r(nums)}

    x.compare!    
  end
end
