# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}

def top_k_frequent(nums, k)
  hash = Hash.new(0)
  nums.each do |x|
    hash[x] += 1
  end
  hash.max_by(k){|key, value| value}.map{|key, value| key}
end


p top_k_frequent([1,1,1,4,4,3], 2)

p top_k_frequent([-1, -1], 1)