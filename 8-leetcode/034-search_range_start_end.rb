# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def search_range(nums, target)
  res = [-1, -1]
  
  nums.each_with_index do |x, i|
      res[0] = i if x == target && res[0] == -1
      res[1] = i if x == target
  end
  res
  
end

def search_range_1(nums, target)
  res = [-1, -1]
  
  nums.each_with_index do |x, i|
      if x == target 
        res[0] = i 
        break
      end
  end
  
  for j in (nums.size-1).downto(0)
    if nums[j] == target
      res[1] = j
      break
    end
  end
  
  res
  
end