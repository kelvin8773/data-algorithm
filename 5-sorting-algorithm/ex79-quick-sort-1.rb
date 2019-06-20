def partition(array)
  pivot,left, right =array[0], [], []
  array.each do |x| 
     x > pivot ? right << x : x == pivot ? 'do nothing': left << x
  end  
  left + [pivot] + right

  # array.reduce([]) {|result, x| x > array[0]? result << x : result.unshift(x)}
end

# p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]

p  partition([45, 25, 46, 48, 28, 6, 13, 5, 36, 44, 7, 4, 11, 30, 24, 34, 15, 31, 38, 49])
# => [25, 28, 6, 13, 5, 36, 44, 7, 4, 11, 30, 24, 34, 15, 31, 38, 45, 46, 48, 49]