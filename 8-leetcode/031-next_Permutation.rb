# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

def next_permutation(nums)   
  l = -1
  (nums.size-2).downto(0) do |i|
      if nums[i]<nums[i+1]
          l = i
          break
      end
  end 

  if l > -1       
    r = l + 1
    (l+1).upto(nums.size-1) do |j|
        if  (nums[j]-nums[l] > 0 && nums[j]-nums[l] < nums[r]-nums[l])
            r = j
        end
    end

    nums[l],nums[r] = nums[r],nums[l]
    
  end 

  nums[l+1..-1] = nums[l+1..-1].sort
   
end

