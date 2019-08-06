# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}

def combination_sum(candidates, target)
  candidates.sort!
  result = []

  def helper(arr, remain, result, res=[], i=0)
    ( result << res.dup; return ) if remain == 0
    return if remain < 0 

    while (i < arr.size) && (remain-arr[i] >= 0)
      res << arr[i]
      helper(arr, remain-arr[i], result, res, i)
      i += 1
      res.pop
    end
    result   
  end

  helper(candidates, target, result)
end


p combination_sum([2,3,6,7], 7)

# p combination_sum([2,3,5], 8)