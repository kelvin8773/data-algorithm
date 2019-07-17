require 'benchmark/ips'

def median_k(array)
  array.each do |x|
    count = 0
    array.each {|y| count += 1 if y <= x}
    return x if count == array.size/2 + 1
  end
end

def advanced_quicksort(array, start=0, last=array.size-1)
  return array if last-start < 1
  pivot = array[last]
  middle = start - 1

  for i in start..last
   array[i] <= pivot ? (middle += 1; array[i], array[middle] = array[middle], array[i] ) : array[i]
  end

  # puts array.join(" ")
  advanced_quicksort(array, start, middle-1)
  advanced_quicksort(array, middle+1, last)
end

def median_k1(array)
  temp = array.clone
  advanced_quicksort(temp)
  temp[array.size/2]
end

def median_r(array)
  array.sort[array.size/2]  
end


def median_y(array, aim = array.size/2)
  pivot = array.last
  left, right = [], [pivot]
  array.each{ |num| num <= pivot ? left << num : right << num unless array.index(num) == array.size-1}
  left.size  == aim ? pivot : left.size > aim ? median_y(left, aim) : median_y(right, aim-left.size)
end



list1 = [0, 1, 2, 4, 6, 5, 2]
# => 2

list2 = [7, 3, 9, 8, 2, 1, 5]
# => 5

list3 = [0, 1, 2, 4, 6, 5, 3]
# => 3

list4 = [0, 1, 2, 4, 6, 5, 3, 8, 9]
# => 4

list5 = [7672, 271, 595, 8906, 1715, 509, 3131, 747, 6663, 5747, 9216, 2830, 5256, 8343, 2185, 839, 7399, 6780, 5754, 4953, 1900, 7752, 5466, 6348, 5783, 4895, 6463, 4655, 8873, 2931, 8912, 3794, 9421, 1082, 4541, 8451, 9862, 5389, 3190, 6894, 3345, 4865, 6587, 7552, 1433, 5276, 3096, 6606, 5475, 368, 2867, 5487, 5905, 5973, 6487, 816, 3036, 8379, 9856, 7390, 4710, 2521, 6906, 6883, 6492, 4910, 7944, 7317, 6836, 1075, 3500, 3504, 7778, 3487, 9073, 4497, 7169, 1097, 2861, 2460, 6418, 3167, 1573, 1346, 5111, 9257, 3463, 5311, 6685, 7845, 3111, 5741, 8566, 1459, 6570, 3458, 3023, 5437, 5750, 6167, 9152]
# => 5437

p median_k1(list2)

all_list = [list2,list3,list4,list5]

all_list.each do |list|
  p "Benchmark test with #{list}"
  Benchmark.ips do |x|
    x.config(:time => 3, :warmup => 2)
    
    x.report("Kelvin's Method") {median_k(list)}
    x.report("Kelvin's Adv Sort Method") {median_k1(list)}
    x.report("Yunus's Method") {median_y(list)}
    x.report("Ruby Sort") {median_r(list)}

    x.compare!    
  end

end