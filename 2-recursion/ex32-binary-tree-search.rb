def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  middle = (min_interval+max_interval)/2.floor
  
  return number if number == 1 
  return (middle-min_interval).abs > (max_interval-middle).abs ? max_interval:min_interval if max_interval-1 == min_interval
  
  return middle if middle*middle == number
  return sqrt_recursive(number, min_interval, middle) if middle*middle > number
  return sqrt_recursive(number, middle, max_interval) if middle*middle < number
end

puts sqrt(1)
puts sqrt(5)
puts sqrt(9)
puts sqrt(16)
puts sqrt(25)
puts sqrt(7056)
puts sqrt(98121)
