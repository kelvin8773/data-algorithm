def partition(array)
  pivot,left, right =array[0], [], []
  array[1..-1].each do |x| 
     x > pivot ? right << x : left << x
  end
   [left, pivot , right]
end

def simple_quicksort(array)
  return array if array.size <= 1
  left, pivot , right = partition(array)
  res = simple_quicksort(left) + [pivot] + simple_quicksort(right)
  # puts res.join(" ")
  return res
end

# p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10