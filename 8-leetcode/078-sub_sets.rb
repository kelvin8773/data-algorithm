# @param {Integer[]} nums
# @return {Integer[][]}

# Ruby build-in method for this challenge!

def subsets_r(nums)
  result = []

  for i in 0..nums.size 
    result += nums.combination(i).to_a
  end
  result
end

def subsets(nums)
  return [[]] if nums.empty?
    
    curr_num = nums.shift
    results = subsets(nums)
    results += results.each_with_object([]) do |sub_set, array|
       array << (sub_set + [curr_num])
    end
    results

end




p subsets([1,2,3])
