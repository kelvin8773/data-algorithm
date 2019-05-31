def move(starting, goal)
  # your code here
  @res = ""
  def helper(starting, goal, n=2)
    peg = [1, 2, 3]
    peg.delete(starting)
    peg.delete(goal)
    middle = peg[0]
    
    if (n>0) 
      helper(starting, middle, n-1)
      @res += "#{starting}->#{goal} "
      helper(middle, goal, n-1)
    end

    return @res
  end
  helper(starting, goal)
end



puts move(1, 3)
# => 1->2 1->3 2->3

# puts move(2, 3)
# => 2->1 2->3 1->3

# puts move(2, 1)

# puts move(1, 2)