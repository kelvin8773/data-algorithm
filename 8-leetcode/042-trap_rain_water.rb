# @param {Integer[]} height
# @return {Integer}

def trap(height)
  left_max = right_max = water = 0
  left, right = 0, height.size-1
  
  while left < right do

    if height[left] < height[right]  
      left_max < height[left] ? (left_max = height[left]) : (water += left_max - height[left])
      left += 1
    else
      right_max < height[right] ? (right_max = height[right]) : (water += right_max - height[right])
      right -= 1
    end
  end

  water
  
end

p trap([0,1,0,2,1,0,1,3,2,1,2,1])
# => 6
