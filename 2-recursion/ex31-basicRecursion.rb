def sum(number)
  if number <= 1
  	return 1
  end
  	number + sum(number-1)
end

# puts sum(4)
# puts sum(10)
puts sum(1000)