def find_pairs(array, k)
  array.each_with_index.inject([]) do |res, (num, index)|  
    array[index..-1].each {|x| res << [num, x] if num + x == k }
    res
  end
end


p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]

p find_pairs([-8, 7, 11, 8, 5, 9, 3, 6, 2, -9, 4], 0)
# => [[-8, 8], [9, -9]]

p find_pairs([17, -20, 21, -3, 33, 10, 6, -11, 19, 40, 11, 17, 56, 33, 72, 5, 1, 36, 51], 40)
# => [[21, 19], [-11, 51]]

#use combination 
def find_pairs_com(array, k)
  # array.combination(2).reject {|pair| pair.sum !=k }
  # array.combination(2).select {|pair| pair.sum ==k }
  array.combination(2).reduce([]){|result, pair| result << pair if pair.sum == k; result }
end


p find_pairs_com([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]

p find_pairs_com([-8, 7, 11, 8, 5, 9, 3, 6, 2, -9, 4], 0)
# => [[-8, 8], [9, -9]]

p find_pairs_com([17, -20, 21, -3, 33, 10, 6, -11, 19, 40, 11, 17, 56, 33, 72, 5, 1, 36, 51], 40)
# => [[21, 19], [-11, 51]]