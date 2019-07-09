require 'benchmark/ips'

def time_scheduler(array)
  events = array.each_slice(2).to_a

  def overlaps?(events)
    for index in 0..events.size-2
      return true if events[index].last >= events[index+1].first
    end
    false
  end

  size = events.size

  until size == 1
    temp = events.combination(size).to_a.find {|x| !overlaps?(x.sort)}
    return temp.sort if !temp.nil?
    size -= 1    
  end

end

########################

def time_scheduler_yunus(array)
  array_ar, i = [], 0
  while i < array.length-1
   array_ar << [array[i], array[i+1]]
   i += 2
  end
  advanced_quicksort(array_ar);  unoverlap(array_ar)
end 

def advanced_quicksort(array, ind1=0, ind2=array.size-1)
  return if ind2 - ind1 < 1
  pivot = array[ind2].last
  change = ind1
  for ind in ind1..ind2
    if array[ind].last <= pivot
      array[change], array[ind] = array[ind], array[change]
      change += 1
    end
  end
  advanced_quicksort(array, ind1, change-2)
  advanced_quicksort(array, change, ind2)
end

def unoverlap(arr)
  res = [arr[0]]
  arr.each {|array|  res << array if array.first > res.last.last}
  res
end

#####################

def time_scheduler_yunus_1(array)
  advanced_quicksort_1(array);  unoverlap_1(array)
end 

def advanced_quicksort_1(array, ind1=0, ind2=array.size-1)
  pivot = array[ind2]
  change = ind1+1
  track = ind1+1
  while track < ind2+1
    if array[track]<= pivot
      array[change], array[track], array[track-1], array[change-1] = array[track], array[change], array[change-1], array[track-1]
      change += 2 unless change >= ind2
    end
    track += 2
  end
  return if ind2 - ind1 < 4
  advanced_quicksort_1(array, ind1, change-2)
  advanced_quicksort_1(array, change+1, ind2)
end

def unoverlap_1(arr)
  res = [[arr[0], arr[1]]]
  ind = 2
  while ind < arr.length
    res << [arr[ind], arr[ind+1]] if arr[ind] >= res.last.last
    ind += 2
  end
  res
end



#####################

def time_scheduler_ebuka(array)
  # write your code here
  eliminate_overlaps(sort_time_slots(array))
end

def sort_time_slots(array)
  return [array] if array.length == 2
  left, right = partiton(array)
  merge_arrays(sort_time_slots(left), sort_time_slots(right))
end

def partiton(array)
  mid_point = array.length / 2
  mid_point += 1 if mid_point.odd?
  [array[0...mid_point], array[mid_point..-1]]
end

def merge_arrays(array1, array2)
  sorted = []
  until array1.empty? || array2.empty?
    if array1.first.last < array2.first.last
      sorted << array1.shift
    else
      sorted << array2.shift
    end
  end
  sorted << array2.shift until array2.empty?
  sorted << array1.shift until array1.empty?
  
  sorted
end

def eliminate_overlaps(array)
  array.each_with_object([array.first]) do |time, result|
    result << time if time.first > result.last.last unless result.include? time
  end
end

##############

# p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# # => [[1,3], [5,6], [7,9]]

# p time_scheduler([3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14])
# # => [[1, 2], [4, 5], [8, 14]]

list = [3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14]

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 3)
  
  x.report("Kelvin's method ") {time_scheduler(list)}
  x.report("Yunus's method ") {time_scheduler_yunus(list)}
  x.report("Yunus's 1 method ") {time_scheduler_yunus_1(list)}
  x.report("Ebuka's method ") {time_scheduler_ebuka(list)}
  x.compare!    
end