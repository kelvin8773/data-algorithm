require 'benchmark/ips'

def index_match(array)
  array.each_with_index do |x, index|
    index == x ? (return x ): 'next'
  end
  -1
end

def index_match_log(array, start_index = 0, end_index = array.length - 1)
  return -1 if start_index > end_index
  
  middle_index = (end_index + start_index) / 2
  return middle_index if array[middle_index] == middle_index
  
  if array[middle_index] > middle_index
    index_match_log(array, start_index, middle_index - 1)
  else
    index_match_log(array, middle_index + 1, end_index)
  end
end

# puts index_match([0, 2, 3, 7, 9, 11])
# => 0


array1 = [0, 2, 3, 7, 9, 11]

array2 = [3, 5, 7, 9, 11, 13, 17]

array3 = [-4, -2, 0, 2, 4, 6, 8, 10]

array4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array5 = [-20, -15, -11, 2, 5, 7, 10, 11, 12, 13, 14, 14]

array6 = [-25, -20, -15, -10, -5, 5, 7, 8, 9, 10, 11, 12]

array7 = [-30, -25, -20, -15, -10, -5, 5, 7, 8, 9, 10, 11, 12, 15, 19, 20, 23, 24, 26, 29, 30]

allarr = [array1, array2, array3, array4, array5, array6, array7]


def performent_test(arr)

  arr.each do |list|  

    Benchmark.ips do |x|
      p "Testing with #{list}"
      x.report("Using Linear method ") {index_match(list)}
      x.report("Using Binary search ") {index_match_log(list)}
      x.compare!
    end

  end

end


performent_test(allarr)







