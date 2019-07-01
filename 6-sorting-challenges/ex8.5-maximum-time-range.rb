require 'benchmark/ips'

def advanced_quicksort(array, start=0, last=array.size-1)
  return array if last-start < 1
  pivot = array[last].first
  middle = start - 1

  for i in start..last
   array[i].first <= pivot ? (middle += 1; array[i], array[middle] = array[middle], array[i] ) : array[i]
  end

  advanced_quicksort(array, start, middle-1)
  advanced_quicksort(array, middle+1, last)
end

def get_max_overlap(events,index=0)  

  first = events[0].first 
  return [first, events[index].last, index] if index >= events.size-1 || events[index].last < events[index+1].first 

  events[index].last >= events[index+1].last ? index+2 <= events.size-1 ? get_max_overlap(events, index+2) : [first,events[index].last, events.size-1] : get_max_overlap(events, index+1)

end

def maximum_time_range_k(array)
  events = array.each_slice(2).to_a
  advanced_quicksort(events)
  result, index = [], 0

  while index < events.size-1
    first, last, move = get_max_overlap(events[index..-1])
    index += move + 1
    result << [first, last]
  end
  result.flatten! if result.size < 2
  return result
end

################

def maximum_time_range_y(array)
  array_ar, i = [], 0
  while i < array.length-1
   array_ar << [array[i], array[i+1]]
   i += 2
  end
  advanced_quicksort_y(array_ar);  ranges(array_ar)
end 

def advanced_quicksort_y(array, ind1=0, ind2=array.size-1)
  return if ind2 - ind1 < 1
  pivot = array[ind2].first
  change = ind1
  for ind in ind1..ind2
    if array[ind].first <= pivot
      array[change], array[ind] = array[ind], array[change]
      change += 1
    end
  end
  advanced_quicksort(array, ind1, change-2)
  advanced_quicksort(array, change, ind2)
end

def ranges(array)
  ind = 0
  j = 1
  res = []
  while j < array.size
    if array[j].first >= array[ind].last
      res << array[ind]
      ind = j
    else
      temp = array[ind].first
      until j >= array.size || array[j].first >= array[ind].last
        ind = j
        j += 1
      end
      j = array.size-1 if j >= array.size
      res << [temp, array[j].last]
      ind = j
    end
    j += 1
  end
  res.flatten! if res.length == 1
  res
end


# p maximum_time_range([10, 18, 4, 6, 14, 16, 5, 8])
# => [[4, 8], [10, 18]]

# p maximum_time_range([5, 14, 1, 4, 13, 19, 3, 6, 9, 8])
# => [1, 19]

# p maximum_time_range([0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5])
# => [[0,1], [3,16]]

list = [0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5]

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 3)
  
  x.report("Kelvin's method ") {maximum_time_range_k(list)}
  x.report("Yunus's method ") {maximum_time_range_y(list)}
  x.compare!    
end
