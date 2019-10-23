# @param {Integer[]} nums
# @return {Integer[]}

def product_except_self(nums)
  res = Array.new(nums.size, 0)
  
  if z_idx = nums.index(0) 
    clone = nums.clone
    clone.delete_at(z_idx)
    res[z_idx] = clone.inject(:*)
    
  else
    product = nums.inject(:*)
    
   for i in 0...nums.size do 
      if nums[i].abs == 1
        res[i] = nums[i] == 1 ? product : -product
      else
        res[i] = product/nums[i]
      end 
    end
   end
  
  res
end

p product_except_self([1, 2, 3, 4, 5])

p product_except_self([1, 1, -1, 1, 1, -1, -1, 1, -1, 1])


