def merge_sort(array1, array2)
  return array1 if array1.size <= 1
  return array2 if array2.size <= 1

  array1 = merge_sort(array1[0..array1.size/2-1], array1[array1.size/2..-1])
  array2 = merge_sort(array2[0..array2.size/2-1], array2[array2.size/2..-1])
  
  array2.reduce([]) do |res, y|
    array1.each_with_index do |index, x|
      y < x ? res << y : res << x
    end
  end

  # p array1
  # p array2

  # array1 + array2

  
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]

