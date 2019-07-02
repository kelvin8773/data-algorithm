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

def merge_sort(array1, array2)
  index = 0
  until array2.size < 1 
    array2[0].first < array1[index].first ? array1.insert(index, array2.shift) 
                  : index >= array1.size-1 ? (array1 = array1 + array2; break) : index += 1
  end
  return array1  
end

def full_merge_sort(array)
    return array if array.size <= 1
    merge_sort(full_merge_sort(array[0...array.size/2]), full_merge_sort(array[array.size/2..-1]))
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


def maximum_time_range_k_2(array)
  events = array.each_slice(2).to_a
  full_merge_sort(events)
  result, index = [], 0

  while index < events.size-1
    first, last, move = get_max_overlap(events[index..-1])
    index += move + 1
    result << [first, last]
  end
  result.flatten! if result.size < 2
  return result
end

def maximum_time_range_k_3(array)
  events = array.each_slice(2).to_a
  events = events.sort
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
  array = array.each_slice(2).to_a
  advanced_quicksort_y(array)
  ranges(array)
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
    advanced_quicksort_y(array, ind1, change-2)
    advanced_quicksort_y(array, change, ind2)
  end
  
  def ranges(array)
    ind = 0
    j = 1
    res = []
    while j < array.size
      if array[j].first > array[ind].last
        res << array[ind]
        ind = j
      else
        temp = array[ind].first
        max = array[ind].last
        until j >= array.size || array[j].first > array[ind].last
          ind = j
          j += 1
          max = array[ind].last if max < array[ind].last
        end
           if j >= array.size-1
             ind = array.size-1
             max = array[ind].last if max < array[ind].last
           end
           res << [temp, max]
           ind = j
      end
      j += 1
    end
    res.flatten! if res.length == 1
    res
  end

##############

def maximum_time_range_e(array)
  get_overlaps(sort_time_slots(array))
end

def get_overlaps(array)
  current_max = array.first
  result = []
  array[1..-1].each do |this_event|
    if this_event.first < current_max.last
      current_max = (current_max + this_event).minmax
    else
      result << current_max
      current_max = this_event
    end
  end
  result << current_max
  return result.first if result.size == 1
  result
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
    if array1.first.first < array2.first.first
      sorted << array1.shift
    else
      sorted << array2.shift
    end
  end
  sorted << array2.shift until array2.empty?
  sorted << array1.shift until array1.empty?
  
  sorted
end







# p maximum_time_range([10, 18, 4, 6, 14, 16, 5, 8])
# => [[4, 8], [10, 18]]

# p maximum_time_range([5, 14, 1, 4, 13, 19, 3, 6, 9, 8])
# => [1, 19]

# p maximum_time_range_y([0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5])
# => [[0,1], [3,16]]

list1 = [10, 18, 4, 6, 14, 16, 5, 8]
list2 = [5, 14, 1, 4, 13, 19, 3, 6, 9, 8]
list3 = [0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5]

all_list = [list1, list2, list3]

all_list.each do |list|
p "Benchmark test with #{list}"
    Benchmark.ips do |x|
      x.config(:time => 3, :warmup => 2)
      
      x.report("Kelvin's solution (advance Sort) ") {maximum_time_range_k(list)}
      x.report("Kelvin's solution (merge Sort) ") {maximum_time_range_k_2(list)}
      x.report("Kelvin's solution (Ruby Sort) ") {maximum_time_range_k_3(list)}
      x.report("Yunus's  solution ") {maximum_time_range_y(list)}
      x.report("Ebuka's  solution ") {maximum_time_range_e(list)}
      x.compare!    
    end
end

# p maximum_time_range_k_3(list1)
