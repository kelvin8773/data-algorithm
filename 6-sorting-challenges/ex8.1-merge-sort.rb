def merge_sort(array1, array2)
  index = 0
  until array2.size < 1 
    # p "#{array1} - #{array1[index]} - #{index} - #{array2[0]}"
    array2[0] < array1[index] ? array1.insert(index, array2.shift) 
                  : index >= array1.size-1 ? (array1 = array1 + array2; break) : index += 1
  end

  return array1
  
end

# p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]

p merge_sort([-3, 2, 2, 2, 4], [-2, 0, 1, 5, 7])

p merge_sort([-4, -3, -1, 1, 3], [0, 5, 7, 9, 11])

p merge_sort([-91, -4, 42, 121, 265, 530], [-623, -54, -7, 651, 721, 850])