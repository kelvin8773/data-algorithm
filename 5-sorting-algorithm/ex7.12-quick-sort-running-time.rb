def insertion_sort(array, index=0, times=0)
  return [array, times] if array[index] > array[index-1] || index == 0
  if array[index] < array[index-1]
    array[index], array[index-1] = array[index-1], array[index]
    times += 1
  end
  insertion_sort(array, index-1, times)  
end

def insertion_sort_running_time(array)
  result= [array, 0]
  for index in 1..array.size-1    
     result = insertion_sort(result[0], index, result[1])
  end

  result[1]
end

def advanced_quicksort_running_time(array, start=0, last=array.size-1, times=0)
  return times if last-start < 1
  pivot = array[last]
  middle = start - 1

  for i in start..last
   array[i] <= pivot ? (times += 1; middle += 1; array[i], array[middle] = array[middle], array[i] ) : array[i]
  end

  # puts array.join(" ")
  times = advanced_quicksort_running_time(array, start, middle-1, times)
  advanced_quicksort_running_time(array, middle+1, last, times)
end

def quicksort_running_time(array)
  array1 = array.clone
  array2 = array.clone
  
  insertion_sort_running_time(array1) -  advanced_quicksort_running_time(array2)
end

# puts quicksort_running_time([1, 3, 9, 8, 2, 7, 5])
# => 1

# puts quicksort_running_time([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
# => 16

puts quicksort_running_time([406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39])
# => 2432



