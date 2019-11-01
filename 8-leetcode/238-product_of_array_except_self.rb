# @param {Integer[]} nums
# @return {Integer[]}

def product_except_self(nums)
  res = Array.new(nums.size, 1)
  for i in 1...nums.size 
    res[i] = res[i-1] * nums[i-1]
  end
  
  right_mx = 1
  (nums.size-1).downto 0 do |i|
    res[i] = res[i] * right_mx
    right_mx *= nums[i]
  end
  res
end

p product_except_self([1, 2, 3, 4, 5])

p product_except_self([1, 1, -1, 1, 1, -1, -1, 1, -1, 1])


