def appears_most_times(array)
  # map = Hash.new

  # array.each do |x|
  #   if map.has_key?(x)
  #     map[x] += 1
  #   else
  #     map[x] = 1
  #   end
  # end

  map = array.reduce(Hash.new(0)){|h, x| h[x] += 1; h}

  map.max_by{|k, v| v }[0]

end

p appears_most_times([1, 2, 3, 1, 5])
# => 1

puts appears_most_times([23, 43, 67, 88, 42, 35, 77, 88, 99, 11])
# => 88

puts appears_most_times([4376, -345, -345, 4376, -345, 84945, 4376, -345, -26509, 4376, 84945, 84945, -26509, 896341, 4376])
# => 4376
