def partition(array)
  pivot,left, right =array[0], [], []
  array.each do |x| 
     x > pivot ? right << x : x == pivot ? 'do nothing': left << x
  end
   [left, pivot , right]
end

def simple_quicksort(array)
  return array if array.size <= 1
  left, pivot , right = partition(array)
  res = simple_quicksort(left) + [pivot] + simple_quicksort(right)
  print "#{res.to_s.gsub(/[\[\],]/, "")}\n"
  return res
end

simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10