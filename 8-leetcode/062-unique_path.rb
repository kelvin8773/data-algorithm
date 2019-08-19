# @param {Integer} m
# @param {Integer} n
# @return {Integer}

def unique_paths_b(m, n)

  def helper(lat, lot, finish, count=0)
    return count += 1 if [lat, lot] == finish
    
    count = helper(lat+1, lot, finish, count) if lat < finish[0]  
    count = helper(lat, lot+1, finish, count) if lot < finish[1]
    # p "#{lat} - #{lot} - #{count}"
    count
  end
    
  helper(1,1, [m, n])

end

def unique_paths(m, n)
  matrix = Array.new(m, Array.new(n, 1))

  for i in 1...m
    for j in 1...n
      matrix[i][j] = matrix[i][j-1] + matrix[i-1][j]
    end
  end

  matrix.last.last
end

# p unique_paths(3, 2)
# => 3

# p unique_paths(3, 3)

# p unique_paths(7, 3)
# => 28

p unique_paths(23, 12)