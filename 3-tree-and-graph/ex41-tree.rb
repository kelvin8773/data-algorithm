def leftmost_nodes_sum(array)
  @sum = 0
  
  def helper(array, index)
    if array[2*index+1] == nil
      return array[index]
    else 
      @sum =+ helper(array, 2*index+1) + array[index]
    end   
    p "#{array}, #{index}, #{@sum}"
    return @sum
  end

  helper(array, 0)  
end

# puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9, 10, 12, 11, 18])
