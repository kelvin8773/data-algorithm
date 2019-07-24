require 'benchmark/ips'

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

def ruby_sort(array)
  array.sort
end

p ruby_sort([1, 3, 9, 8, 2, 7, 5])


p advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9

p advanced_quicksort([9, 8, 6, 7, 3, 5, 4, 1, 2])
# =>  1 2 6 7 3 5 4 9 8
#     1 2 6 7 3 5 4 8 9
#     1 2 3 4 6 5 7 8 9
#     1 2 3 4 6 5 7 8 9
#     1 2 3 4 5 6 7 8 9

# p advanced_quicksort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])

p advanced_quicksort([406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39])

list = [406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39]


Benchmark.ips do |x|
    x.config(:time => 3, :warmup => 2)
    
    x.report("Kelvin's Method") {advanced_quicksort(list)}  
    x.report("Ruby Sort") {ruby_sort(list)}

    x.compare!    
end


