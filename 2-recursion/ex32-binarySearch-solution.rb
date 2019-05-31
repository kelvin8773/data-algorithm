def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  # Your code here
  mid = ((max_interval - min_interval) / 2) + min_interval
	x = mid ** 2
	
	if x == number
		mid
	elsif x < number
		sqrt_recursive(number, mid + 1, max_interval)
	else
		sqrt_recursive(number, min_interval, mid - 1)
	end
end

puts sqrt(25)
puts sqrt(7056)
