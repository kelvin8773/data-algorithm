def hanoi_steps(number_of_discs)
  starting = 1
  goal = 3

  def move(starting, goal, n) 
    peg = [1, 2, 3]
    peg.delete(starting)
    peg.delete(goal)
    middle = peg[0]
    
    if (n>0) 
      move(starting, middle, n-1)      
      puts  "#{starting}->#{goal}\n"
      move(middle, goal, n-1)
    end

  end

  move(starting, goal, number_of_discs)
end

hanoi_steps(2)
# => 1->2 
#    1->3 
#    2->3

puts "break"

hanoi_steps(3)
# => 1->3 
#    1->2
#    3->2
#    1->3
#    2->1
#    2->3
#    1->3

puts "break"

hanoi_steps(4)
# => 1->2
#    1->3
#    2->3
#    1->2
#    3->1
#    3->2
#    1->2
#    1->3
#    2->3
#    2->1
#    3->1
#    2->3
#    1->2
#    1->3
#    2->3

puts "break"
hanoi_steps(5)