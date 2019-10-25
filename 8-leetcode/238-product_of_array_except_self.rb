# @param {Integer[]} nums
# @return {Integer[]}

def product_except_self(nums)
  res = Array.new(nums.size, 0)
  product = nums.inject(:*)
  for i in 0...nums.size
    if nums[i].abs == 1
      res[i] = nums[i] == 1 ? product : -product
    else
      temp = nums[0...i] + nums[i+1..-1]
      res[i] = temp.inject(:*)
      return res if nums[i] == 0
    end 
  end
  res
end

p product_except_self([1, 2, 3, 4, 5])

p product_except_self([1, 1, -1, 1, 1, -1, -1, 1, -1, 1])


