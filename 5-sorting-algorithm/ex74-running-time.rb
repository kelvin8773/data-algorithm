def insertion_sort(array, index=0, times=0)
  return [array, times] if array[index] > array[index-1] || index == 0
  if array[index] < array[index-1]
    array[index], array[index-1] = array[index-1], array[index]
    times += 1
    puts array.join(' ')
  end
  insertion_sort(array, index-1, times)  
end

def running_time(array)
  result= [array, 0]
  #start from 1 because insertion sort default assume array[0] is sorted.
  for index in 1..array.size-1    
     result = insertion_sort(result[0], index, result[1])
    #  puts array.join(' ')
  end

  result[1]
end

# puts running_time([2, 1, 3, 1, 2])
# => 4

puts running_time([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
