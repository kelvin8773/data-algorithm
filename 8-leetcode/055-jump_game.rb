# @param {Integer[]} nums
# @return {Boolean}

def can_jump_r(nums, start=0)
  return true if nums.size - start == 1
  
  next_step = [start + nums[start], nums.size-1].min

  for i in start+1..next_step do 
    if can_jump(nums,i)
      return true
    end
  end

  false
end

def can_jump_greedy(nums)
  return true if nums.length < 2
  current = nums.length - 1
  distance = 0
  while current > 0
    current -= 1
    distance += 1
    if nums[current] >= distance
      distance = 0
    end
  end
  return distance == 0
end

def can_jump(nums)
  len = nums.size
  i = max = 0
  
  while i <= max do
    max = [max, i+nums[i]].max
    p max
    return true if max >= len-1
    i += 1
  end 
  false 
end


# p can_jump([2,3,1,1,4])

# p can_jump([2,3,1,1,4])
# => true

# p can_jump([3,2,1,0,4])
# => false

# p can_jump([1, 2, 3])

# p can_jump([0,1])

# p can_jump([0])

# p can_jump([2, 0, 0])

# p can_jump([2,5,0,0])

p can_jump([2,0,6,9,8,4,5,0,8,9,1,2,9,6,8,8,0,6,3,1,2,2,1,2,6,5,3,1,2,2,6,4,2,4,3,0,0,0,3,8,2,4,0,1,2,0,1,4,6,5,8,0,7,9,3,4,6,6,5,8,9,3,4,3,7,0,4,9,0,9,8,4,3,0,7,7,1,9,1,9,4,9,0,1,9,5,7,7,1,5,8,2,8,2,6,8,2,2,7,5,1,7,9,6])
