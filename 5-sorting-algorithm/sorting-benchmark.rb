require 'benchmark/ips'

def ruby_sort(array)
  array.sort
end

########## insertion sort

def insertion_sort(array) 
  result = array.dup

  def helper(array, index=0)
    return array if array[index] > array[index-1] || index == 0
    if array[index] < array[index-1]
      array[index], array[index-1] = array[index-1], array[index]
    end
    helper(array, index-1)  
  end
  
  #start from 1 because insertion sort default assume array[0] is sorted.
  for index in 1..result.size-1    
    result = helper(result, index)  
 end 

 result
end

######### Quick Sort

def quicksort(array)

  def partition(array)
    pivot,left, right =array[0], [], []
    array[1..-1].each do |x| 
       x > pivot ? right << x : left << x
    end
     [left, pivot , right]
  end

  return array if array.size <= 1
  left, pivot , right = partition(array)
  res = quicksort(left) + [pivot] + quicksort(right)
  return res

end


########## Quick Sort Advance

def advanced_quicksort(array)

  def helper(array, start=0, last=array.size-1)
    return array if last-start < 1
    pivot = array[last]
    middle = start - 1

    for i in start..last
    array[i] <= pivot ? (middle += 1; array[i], array[middle] = array[middle], array[i] ) : array[i]
    end
    # puts array.join(" ")
    helper(array, start, middle-1)
    helper(array, middle+1, last)
  end

  result = array.dup

  helper(result)  
  
end


array = [1, 4, 6, 9, 3]

array1 = [9, 8, 6, 7, 3, 5, 4, 1, 2]

array2 = [406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39]

all_list = [array, array1, array2]

p ruby_sort(array1)

p insertion_sort(array1)

p quicksort(array1)

p advanced_quicksort(array1)


all_list.each do |list|
p "Benchmark test with #{list}"
Benchmark.ips do |x|
  x.config(:time => 3, :warmup => 2)
  
  x.report("Ruby Sort") {ruby_sort(list)}
  x.report("Insertion Sort") {insertion_sort(list)}
  x.report("Quick Sort") {quicksort(list)}
  # x.report("Adv Quick Sort") {advanced_quicksort(list)}
  
  x.compare!    
end

end