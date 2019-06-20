def partition(array)
  pivot,left, right =array[0], [], []
  array.each do |x| 
     x > pivot ? right << x : x == pivot ? 'do nothing': left << x
  end
   [left, pivot , right]
end

def simple_quicksort(array)
  return array if array.size <= 1
  sort_array = partition(array)
  res = simple_quicksort(sort_array[0]) + [sort_array[1]] + simple_quicksort(sort_array[2])
  print "#{res.to_s.gsub("[","").gsub("]", "").gsub(",", "")}\n"
  return res
end

simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10