# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

def sort_colors(nums)
  counts = Array.new(3, 0)
  nums.each {|x| counts[x] += 1 }

  idx = 0

  counts.each_with_index do |num, i|
    num.times do 
      nums[idx] = i
      idx += 1
    end
  end

  nums

end

p sort_colors([2,0,2,1,1,0])

p sort_colors([2,0,2,1,1,0,1,0,2,1])