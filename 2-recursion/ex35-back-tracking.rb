def exact_sum?(k, coins) 
  size = coins.size
  def helper(k, list)
    list.each do |sub_list|
      return true if sub_list.sum == k
    end
    return false
  end

  (1..size).each do |n|
    return true if helper(k, coins.combination(n).to_a)
  end
  return false

end

puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true

puts exact_sum?(11, [1, 5, 9, 13])
# => false

puts exact_sum?(18, [12, 19 , 7, 9, 13, 21, 10, 8, 10])


