def hanoi_steps(number_of_discs, start=1, middle=2, goal=3)
  return nil if number_of_discs == 0
  
  hanoi_steps(number_of_discs-1, start, goal, middle)
  puts "#{start}->#{goal}\n"
  hanoi_steps(number_of_discs-1, middle, start, goal)

end

hanoi_steps(2)
puts "break -------------------------------"
hanoi_steps(3)
puts "break -------------------------------"
hanoi_steps(4)
puts "break -------------------------------"
hanoi_steps(5)
puts "break -------------------------------"
