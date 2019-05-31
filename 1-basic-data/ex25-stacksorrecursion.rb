def tree_height_K(tree_as_list)
  len = tree_as_list.length
  height = 0
  while len >0
    len = len - 2**height
    height += 1
  end
  return height
end


def tree_height(tree_as_list)
  Math.log2(tree_as_list.length).ceil
end

def tree_height_r(tree_as_list)
  if tree_as_list.length <= 1
    return 1
  else
    height = tree_height_r(tree_as_list)
    (2**height).each do
      tree_as_list.pop
    end
  end
end

puts tree_height_K([2, 7, 5, 2, 6, 0, 9])


# puts tree_height_K([2, 7, 5, 2, 6, 0, 9])
# puts tree_height([2, 7, 5, 2, 6, 0, 9])
# # => 3

# puts tree_height_K([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# # => 4

# puts tree_height_K([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# # => 4