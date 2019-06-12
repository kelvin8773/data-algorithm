def insertion_sort(array)
  index = array.size-1
  temp = array[index]
  
  loop do
    current = array[index-1]
    if temp > current || index == 0
      array[index] = temp
      break 
    end
    array[index] = current
    puts array.join(' ')
    index = index - 1
  end
  puts array.join(' ')
end

insertion_sort([1, 3, 2])
# => 1 3 3
#    1 2 3

puts '-' * 20

insertion_sort([1, 4, 6, 9, 3])
# => 1 4 6 9 9
#    1 4 6 6 9
#    1 4 4 6 9
#    1 3 4 6 9