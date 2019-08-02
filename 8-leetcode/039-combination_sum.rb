# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}


def combination_sum(candidates, target)
  res = []
  
  candidates.each do |x|
    next if x > target
    remain = target % x

    if remain == 0
      res<< Array.new(target/x, x)
    elsif candidates.include?(remain)
      res << (Array.new(target/x, x) + [remain]).sort
    end
  end
  res
end


p combination_sum([2,3,4,6,7], 9)

p combination_sum([2,3,5], 8)