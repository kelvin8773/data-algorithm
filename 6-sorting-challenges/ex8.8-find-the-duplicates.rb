require 'benchmark/ips'

def duplicates(arr1, arr2)
  res = arr2.clone
  arr1.each do |x|
    res.delete_at(res.index(x)) 
  end
  res.sort!
end

def duplicates_e(arr1, arr2)
  map1 = arr1.each_with_object(Hash.new(0)) { |num, map| map[num] += 1 }
  map2 = arr2.each_with_object(Hash.new(0)) { |num, map| map[num] += 1 }

  map2.select { |key, value| value > map1[key] }.keys.sort
end

def duplicates_y(arr1, arr2)
  source = arr1.each_with_object(Hash.new(0)){|num, hash| hash[num]+=1}
  compare= arr2.each_with_object(Hash.new(0)){|num, hash| hash[num]+=1}
  res = []
  compare.each {|key, value| res << key if value > source[key]}
  res.sort
end

# p duplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206], [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
# => [204, 205, 206]

# p duplicates([10, 3, 17, 11, 5, 10, 3, 9, 11, 33, 41, 22, 8, 17, 3, 11, 35, 52, 73, 88], [22, 3, 10, 11, 33, 41, 11, 5, 3, 17, 10, 3, 9, 11, 52, 73, 88, 35, 10, 11, 3, 8, 17, 8])
# =>[3, 8, 10, 11]


list1 = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
list2 = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206]

# list1 = [10, 3, 17, 11, 5, 10, 3, 9, 11, 33, 41, 22, 8, 17, 3, 11, 35, 52, 73, 88]
# list2 = [22, 3, 10, 11, 33, 41, 11, 5, 3, 17, 10, 3, 9, 11, 52, 73, 88, 35, 10, 11, 3, 8, 17, 8]


Benchmark.ips do |x|
  x.config(:time => 3, :warmup => 2)
  
  x.report("Kelvin's Method") {duplicates(list1, list2)}
  x.report("Yunus's Method") {duplicates_y(list1, list2)}
  x.report("Ebuka's Method") {duplicates_e(list1, list2)}

  x.compare!    
end