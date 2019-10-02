# @param {Integer[]} nums
# @return {Integer}

def find_unsorted_subarray(nums)
  sort_arr = nums.clone
  sort_arr.sort!
  start = finish = nil
  sorted = true
  nums.each_with_index do |x, i|
    if x != sort_arr[i] && sorted 
      start = i if start.nil?
      sorted = false
    end
    if x == sort_arr[i] && !sorted
      finish = i
      sorted = true
    end
  end
  finish = nums.size if !sorted
  start.nil? ? 0 : finish - start
end

p find_unsorted_subarray([2, 1])
# => 2

p find_unsorted_subarray([5,4,3,2,1])
# => 5

p find_unsorted_subarray([1,2,3,4])
# => 4 
