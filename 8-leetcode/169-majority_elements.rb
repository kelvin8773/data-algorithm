# @param {Integer[]} nums
# @return {Integer}

def majority_element_h(nums)
  count = Hash.new(0)
  nums.each do |x|
    count[x] += 1
  end
  count.max_by{|k, v| v }.first
end

def majority_element_m(nums)
  nums.sort!
  nums[nums.size/2]
end

def majority_element(nums)
  count = 0
  candidate = nil

  nums.each do |x|
    candidate = x if count.zero?
    p "#{candidate} - #{count}"
    count += (x == candidate ? 1 : -1)
  end
  candidate
end

# p majority_element([3, 2, 3])
# => 3

# p majority_element([2, 2, 1, 1, 1, 2, 2])
# => 2

p majority_element([7, 7, 7, 7, 2, 5, 5])