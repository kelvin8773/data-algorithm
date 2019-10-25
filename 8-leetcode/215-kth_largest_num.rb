# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

def find_kth_largest(nums, k)
  max = []
  min = 1/0.0
  nums.each do |num|
    if max.size < k
      max << num
        min = num if min > num
    else
        if num > min
          max << num
          max.delete_at(max.index min)
          min = max.min
        end
    end
    p max
  end
  max.min
end

p find_kth_largest([3,2,1,5,6,4], 2)
