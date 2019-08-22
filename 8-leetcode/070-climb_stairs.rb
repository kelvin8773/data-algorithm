# @param {Integer} n
# @return {Integer}

def climb_stairs_f(n)
  fibo_arr = [0, 1, 2]
  return fibo_arr[n] if n < 3

  for i in 3..n 
    fibo_arr << fibo_arr[i-1] + fibo_arr[i-2]
  end
  
  fibo_arr.last
end

def climb_stairs_b(n)  
  def helper(i, n)
    return 0 if i > n
    return 1 if i== n  
    helper(i+1, n) + helper(i+2, n)
  end 
  helper(0, n)  
end

def climb_stairs(n)  
  def helper(i, n, memo=[])
    return 0 if i > n
    return 1 if i== n
    return memo[i] if memo[i] && memo[i] > 0   
    memo[i] = helper(i+1, n, memo) + helper(i+2, n, memo)
  end
  
  helper(0, n) 
end


p climb_stairs(1)

p climb_stairs(2)

p climb_stairs(3)
# => 3

p climb_stairs(4)
# => 5

# p climb_stairs(5)
# => 8

p climb_stairs(35)

# p climb_stairs(64)