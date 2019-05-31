
def exact_sum?(k, coins)
  if coins.include?(k)
    p "#{k}, #{coins} -- find the solution!"
    return true 
  end

  if k < 0 || coins.empty?
    p "#{k}, #{coins} --- reach the end!"
    return false
  end

  p "#{k}, #{coins}"  
  exact_sum?(k - coins[0], coins[1..-1]) || exact_sum?(k, coins[1..-1])

end

def exact_sumSolution(k, coins, s='')

  if coins.include?(k)
    # do sth
    # s << coins[0]
    return true
  elsif k < 0 || coins.empty
    # do sth
    return false
  else
    
    for coin in coins
       if exact_sumSolution(k-coins[0], coins[1..-1])
        return 
  end
end

# puts exact_sum?(11, [10])
puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true

# puts exact_sum?(11, [1, 5, 9, 13])
# # # => false

# puts exact_sum?(18, [12, 19 , 7, 9, 13, 21, 10, 8, 10])

# puts exact_sum?(0, [1, 2, 4, 3, 5])



