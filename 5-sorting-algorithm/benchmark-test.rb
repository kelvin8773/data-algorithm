require 'benchmark/ips'

# load local methods

require './ex7.10-simple-quick-sort.rb'
require './ex7.11-quick-sort-advance.rb'

# p advanced_quicksort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])

simple_quicksort([5, 8, 1, 3, 7, 10, 2])


array1 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]   # For ex7.11

Benchmark.ips do |x|
  x.config(:time => 3, :warmup => 2)
  
  x.report("Ex7.10-simple-Quick-Sort ") { simple_quicksort(array1) }
  x.report("Ex7.11-Advance-Quick-Sort ") { advanced_quicksort(array1) }
  
  x.compare!    
end