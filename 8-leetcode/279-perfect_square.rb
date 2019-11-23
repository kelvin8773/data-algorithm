# @param {Integer} n
# @return {Integer}

def num_squares(n)
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


# p num_squares(12)
# 3

# p num_squares(13)
# 2

p num_squares(43)
# 3
