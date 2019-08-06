# @param {Integer[]} nums
# @return {Integer}

def moves_to_make_zigzag(nums)
  min_num_up = 9999

  up = true 

  for i in 0..nums.size-2 do
    if i%2 == 0 && up
      if nums[i] > nums[i+1]
        temp = nums[i] - nums[i+1] + 1
        min_num_up = temp if min_num_up > temp
        break
      end
    elsif i%2 !=0 && up
      if nums[i] < nums[i+1]
        temp = nums[i+1] - nums[i] + 1
        min_num_up = temp if min_num_up > temp
        break
      end
    end
  end

  min_num_down = 9999
  
  up = false

  for i in 0..nums.size-2 do
    if i%2 == 0 && !up
      if nums[i] < nums[i+1]
        temp = nums[i+1] - nums[i] + 1
        min_num_down = temp if min_num_down > temp
        break
      end
    elsif i%2 !=0 && up
      if nums[i] > nums[i+1]
        temp = nums[i] - nums[i+1] + 1
        min_num_down = temp if min_num_down > temp
        break
      end
    end
  end

  min_num_up = min_num_up < 9999 ? min_num_up : 0
  min_num_down = min_num_down < 9999 ? min_num_down : 0

  [min_num_up, min_num_down].min

end


p moves_to_make_zigzag([1, 2, 1])
# => 0

# p moves_to_make_zigzag([1, 2, 3])
# => 2

# p moves_to_make_zigzag([9,6,1,6,2])

p moves_to_make_zigzag([2,7,10,9,8,9])
# => 4



