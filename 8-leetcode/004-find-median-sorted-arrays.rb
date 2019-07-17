# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

def find_median_sorted_arrays(nums1, nums2)
  all_nums = (nums1 + nums2).sort
  len = all_nums.size
  ( all_nums[(len-1)/2] + all_nums[len/2] ) / 2.0
    
end

nums1 = [1, 2]
nums2 = [3, 4]

p find_median_sorted_arrays(nums1, nums2)