require 'set'

def find_duplicates(array)
  set = Set.new()
  res = []

  array.each do |x|
    if set.include?(x)
      res << x
    else
      set << x
    end
  end

  return res

end

p find_duplicates([1, 2, 3, 1, 5, 6, 7, 8, 5, 2])
# # => [1, 5, 2]

p find_duplicates([3, 501, 17, 23, -43, 67, 5, 888, -402, 235, 77, 99, 311, 1, -43])
# # => [-43]


p find_duplicates([85, 105, 90, 275, 30, 100, 275, 110, 125, 130, 275, 10, 20, 30, 45, 50, 275, 65, 70, 111])

# [275, 275, 30, 275]

p find_duplicates([4376, -345, -345, 4376, -345, 84945, 4376, -345, -26509])

# [-345, 4376, -345, 4376, -345]