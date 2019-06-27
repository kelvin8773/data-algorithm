def index_match(array)
  res = []
  array.each_with_index do |x, index|
    index == x ? res << x : x > index ? break : 'next'
  end
  res.empty? ? -1 : res.first
end

puts index_match([0, 2, 3, 7, 9, 11])
# => 0

puts index_match([3, 5, 7, 9, 11, 13, 17])
# => -1

puts index_match([-4, -2, 0, 2, 4, 6, 8, 10])
# => 4

puts index_match([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
# => -1

puts index_match([-20, -15, -11, 2, 5, 7, 10, 11, 12, 13, 14, 14])
# => -1

puts  index_match([-25, -20, -15, -10, -5, 5, 7, 8, 9, 10, 11, 12])
# => 5





