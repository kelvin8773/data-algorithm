# @param {Integer} n
# @return {Integer}

def num_squares_b(n)
  base = 1
  square_arr = []
  min_count = 9999999

  while base**2 <= n
    square_arr << base**2
    base += 1
  end
  p [n, square_arr]
  def get_perfect_sum(number, array)
    count = 0
    remain = number
    clone_arr = array.clone
    
    while remain > 0
      if remain < clone_arr.last
        clone_arr.pop
        next
      end
      p [remain, clone_arr.last]
      remain = remain - clone_arr.last
      count += 1
    end
    p ['result **********', count]
    count
  end
 last_idx = square_arr.size-1 
 for i in 0..last_idx
  count = get_perfect_sum(n, square_arr[0..last_idx-i])
  min_count = count if min_count > count
 end
  min_count
end

def num_squares(n)
  res = Array.new(n+1, Float::INFINITY)
  res[0] = 0
  
  for i in 1..n
    for j in 1..(Math.sqrt(n).floor())
      res[i] = [res[i-j*j]+1, res[i]].min
    end
  end
  
  res[n]
end


# p num_squares(12)
# 3

# p num_squares(13)
# 2

p num_squares(43)
# 3

p num_squares(4586)
# 2
