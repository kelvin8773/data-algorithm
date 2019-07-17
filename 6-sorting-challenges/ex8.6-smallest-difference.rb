require 'benchmark/ips'

def advanced_quicksort(array, start=0, last=array.size-1)
  return array if last-start < 1
  pivot = array[last]
  middle = start - 1

  for i in start..last
    (middle += 1; array[i], array[middle] = array[middle], array[i] ) if array[i] <= pivot 
  end

  advanced_quicksort(array, start, middle-1)
  advanced_quicksort(array, middle+1, last)
end

def smallest_difference(array)
  advanced_quicksort(array)
  min_difference = Float::INFINITY
  result = []

  for i in 1..array.size-1
    diff = array[i] - array[i-1]
    if min_difference > diff
      min_difference = diff
      result = [array[i-1], array[i]]
    end
  end

 result
end

def smallest_difference_1(array)
  array = array.sort
  min_difference = Float::INFINITY
  result = []

  for i in 1..array.size-1
    diff = array[i] - array[i-1]
    if min_difference > diff
      min_difference = diff
      result = [array[i-1], array[i]]
    end
  end

 result
end

def smallest_difference_m(array)
  numbers = [array[0], array[1]]
  min_dif = (array[0] - array[1]).abs
  
  array.each_with_index do |n1, i|
    array[(i + 1)..-1].each do |n2|
      diff = (n1 - n2).abs
      
      if min_dif > diff
        numbers = [n1, n2]
        min_dif = diff
      end
    end
  end
  
  [numbers.min, numbers.max]
end

#######################

# Yunus's Solution

def smallest_difference_y(array)
  array = recursive_merge(array)
  min = array[1] - array[0]
  start, endy = 0, 1
  array.each_with_index do |num, ind|
    if ind+1 < array.size && array[ind+1] - num < min
      min = array[ind+1] - num
      start, endy = ind, ind+1
    end
    
  end
  [array[start], array[endy]]
end

def recursive_merge(array)
  return array if array.size == 1
  half = (array.length-1)/2
  array1, array2 = array[0..half], array[half+1..-1]
  merge(recursive_merge(array1), recursive_merge(array2))
end

def merge(array1, array2)
   a1, a2 = 0, 0
 res = []
 until a1 == array1.size || a2 == array2.size
 if array1[a1] <= array2[a2]
   res << array1[a1]
   a1 += 1
 else
   res << array2[a2]
  a2 += 1
 end
 end
 if a1 < array1.size
   res + array1[a1..-1]
 elsif a2 < array2.size
 res + array2[a2..-1]
 else
   res
  end
end

##################
# Afani's Solution

def smallest_difference_a(array)
  # write your code here
  infinite_diff = Float::INFINITY
  min_nums = []
  arr = array.sort
  for i in 0...arr.length-1
    if (arr[i+1] - arr[i]) < infinite_diff
      infinite_diff = (arr[i+1] - arr[i])
      min_nums = [arr[i+1], arr[i]]
    end
  end
  min_nums.minmax
  
end

##################




# p smallest_difference([-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854])
# => [-20, 30]

p smallest_difference([1000, -3916237, -357920, -3620601, 7374819, -7330761, 1003, 6246457, -6461594, 266854])
# => [1000, 1003]

p smallest_difference([-5935536, -4857144, 8762611, -3710156, -62196, 5726532, 3880783, 8228893, 4557632, 8243459, 8058689, -2004515, -2532128, -2809277, 6230123, -1534444, 7594023, 8030804, -808395, 3895414, -1042916, -6349277, 8056932, 6449041, -5776338, -5663713, -2118668, -7889996, -7194680, 4072724, 5817742, 52723, -9978630, -4565272, -905845, 2413011, 6580118, 7342503, 9920829, 3264328, -2498614, -7173602, 9550646, -3508831, 6660598, 7160307, -1454798, -7810912, -6934054, 5412837, -3256366, 5648256, 7539528, 8948739, -9432879, 540367, -683895, -4837582, 404577, -7427248, 7493712, -7517462, 59838, 7493355, 2624635, 7528881, 4482783, 5371130, -7137887, 5776578, -4043963, -4861937, -5490722, -3065192, -1330264, -5049584, 8815653, -2956679, -3663308, 3294818, -3792431, -6884969, -6327570, -3304021, -7320937, -2754952, 5645257, 1616120, 2854718, 3721762, 9874605, 5629627, 5448934, 6511446, -4557691, 4035783, -4467467, 2150627, 6427050, 3916593])
# => [7493355, 7493712]

#################################


list1 = [-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854]
list2 = [1000, -3916237, -357920, -3620601, 7374819, -7330761, 1003, 6246457, -6461594, 266854]
list3 = [-5935536, -4857144, 8762611, -3710156, -62196, 5726532, 3880783, 8228893, 4557632, 8243459, 8058689, -2004515, -2532128, -2809277, 6230123, -1534444, 7594023, 8030804, -808395, 3895414, -1042916, -6349277, 8056932, 6449041, -5776338, -5663713, -2118668, -7889996, -7194680, 4072724, 5817742, 52723, -9978630, -4565272, -905845, 2413011, 6580118, 7342503, 9920829, 3264328, -2498614, -7173602, 9550646, -3508831, 6660598, 7160307, -1454798, -7810912, -6934054, 5412837, -3256366, 5648256, 7539528, 8948739, -9432879, 540367, -683895, -4837582, 404577, -7427248, 7493712, -7517462, 59838, 7493355, 2624635, 7528881, 4482783, 5371130, -7137887, 5776578, -4043963, -4861937, -5490722, -3065192, -1330264, -5049584, 8815653, -2956679, -3663308, 3294818, -3792431, -6884969, -6327570, -3304021, -7320937, -2754952, 5645257, 1616120, 2854718, 3721762, 9874605, 5629627, 5448934, 6511446, -4557691, 4035783, -4467467, 2150627, 6427050, 3916593]


all_list = [list1, list2, list3]

all_list.each do |list|
p "Benchmark test with #{list}"
    Benchmark.ips do |x|
      x.config(:time => 3, :warmup => 2)
      
      x.report("Kelvin-Adv Q-Sort") {smallest_difference(list)}
      x.report("Kelvin-Ruby Sort") {smallest_difference_1(list)}
      x.report("Model-No Sort") {smallest_difference_m(list)}
      x.report("Yunus-Merge Sort") {smallest_difference_y(list)}
      x.report("Afani-Ruby Sort") {smallest_difference_a(list)}

      x.compare!    
    end
end