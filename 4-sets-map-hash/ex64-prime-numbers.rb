require 'set'

def number_of_primes(arr)
  @max = 10000
  prime_numbers = Set.new(2..@max)

  for i in 2..Integer.sqrt(@max)
    if prime_numbers === i
      m = 0
      j = i**2
      while j <= @max
        prime_numbers.delete(j)
        m += 1
        j = i**2 + m*i
      end
    end
  end

  arr.count {|x| prime_numbers === x}
end

puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# # => 4

puts number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 3