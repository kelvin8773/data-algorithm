# @param {Integer[]} nums
# @return {Integer}

def max_sub_array(nums)
  max_sum = nums.sum
  cur_sum = i = 0
 
  while i < nums.size
    cur_sum = [cur_sum+nums[i], nums[i]].max   # continue sum if sum is bigger than current num
    max_sum = [max_sum, cur_sum].max # get the max sum
    i += 1
  end 

  max_sum
end


p max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
# => 6

p max_sub_array([1,2,-1,-2,2,1,-2,1,4,-5,4])

p max_sub_array([-2, 1])

p max_sub_array([-1,-2,-3,0])

p max_sub_array([0,0,-3,1])


