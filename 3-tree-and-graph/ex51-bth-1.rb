def binary_tree_height(array_tree)
  def helper(array, index=0, height=0)
    if array[index] == nil || array[index] == 0
      return height
    else 
      h1 = helper(array, 2*index+1, height + 1) 
      h2 = helper(array, 2*index+2, height + 1)
    end
    return h1 > h2 ? h1:h2
  end 

helper(array_tree)
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9, 12])
# => 4