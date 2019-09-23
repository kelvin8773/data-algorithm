# @param {Integer[]} nums
# @return {Integer}

def rob(nums)
  def helper(nums, house, rob=0)
    p "#{house} + #{rob}"
    return nums.max if nums.size <= 2
    return rob if house >= nums.size

    [ helper(nums, house+2, rob+nums[house]), 
      helper(nums, house+3, rob+nums[house]) ].max
  end

  [helper(nums, 0), helper(nums, 1)].max
end

p rob([2, 4])
# => 4

p rob([2, 7, 9, 3, 1, 4])
# => 12

p rob([226,174,214,16,218,48,153,131,128,17,157,142,88,43,37,157,43,221,191,68,206,23,225,82,54,118,111,46,80,49,245,63,25,194,72,80,143,55,209,18,55,122,65,66,177,101,63,201,172,130,103,225,142,46,86,185,62,138,212,192,125,77,223,188,99,228,90,25,193,211,84,239,119,234,85,83,123,120,131,203,219,10,82,35,120,180,249,106,37,169,225,54,103,55,166,124])