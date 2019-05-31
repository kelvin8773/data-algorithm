def binary_tree_height(array_tree)
  i = 0
  height = 1
  until array_tree[2*i+1] == nil
    if array_tree[2*i+1] != 0
      i = 2 * i + 1
      height += 1
    else
       i += 1
    end
  
  end

  return height

end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3