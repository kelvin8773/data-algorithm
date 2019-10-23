# @param {Integer[]} nums
# @return {Integer}

def find_duplicate(nums)
    
  h = Hash.new(0)
   
      for i in 0...nums.size
  
         # return nums[i] if nums[i+1..-1].include?(nums[i])
  
         # return nums[i] if (nums[0...i] - [nums[i]]).size < nums[0...i].size
  
          # nums[i+1..-1].each do |x|
          #     return nums[i] if nums[i] == x
          # end
  
          h[nums[i]] += 1
          return nums[i] if h[nums[i]] > 1
  
      end
      
  end
  
  
  
  
  
  