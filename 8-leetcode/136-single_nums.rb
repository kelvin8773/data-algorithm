# @param {Integer[]} nums
# @return {Integer}
require 'Set'

def single_number_h(nums)
    count = Hash.new(0)
    
    nums.each do |x|
       count[x] +=1
    end

    count.each do |key, value|
      return key if value == 1
    end
end

def single_number_s(nums)
    set = Set.new
    nums.each do |x|
      set.include?(x) ? (set.delete(x)) : (set.add(x))
    end
    set.first
end

def single_number_sort(nums)
  nums.sort!
  i = 0

  until i > nums.size
    return nums[i] if nums[i] != nums[i+1]
    i += 2
  end
  nums[-1]
end


def single_number(nums)
  

end



p single_number([2,2,1])

p single_number([4,1,2,1,2])