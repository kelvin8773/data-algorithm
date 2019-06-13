def insertion_sort(array, index=0)
  # puts array.join(' ')
  return array if array[index] > array[index-1] || index == 0
  if array[index] < array[index-1]
    array[index], array[index-1] = array[index-1], array[index]
  end
  insertion_sort(array, index-1)  
end

def sort_itself(array)
  #start from 1 because insertion sort default assume array[0] is sorted.
  for index in 1..array.size-1    
     array = insertion_sort(array, index)
     puts array.join(' ')
  end  
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9

sort_itself([9, 8, 6, 7, 3, 5, 4, 1, 2])

# sort_itself([406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39])

