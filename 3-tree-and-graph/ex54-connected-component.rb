def connected_graph?(graph)
  visited = [0]
  key = 0
  queue = graph[key]

  until queue.empty?
    key = queue.shift
    next if visited.include?(key)
    for value in graph[key]
      if !visited.include?(value) 
        queue << value
      end
    end
    visited << key  
  end

  visited.size == graph.keys.size

end

puts connected_graph?({
  0 => [2], 
  1 => [4], 
  2 => [0, 5, 3], 
  3 => [5, 2], 
  4 => [5, 1], 
  5 => [4, 2, 3]
})
# => true

puts connected_graph?({
  0 => [2], 
  1 => [4], 
  2 => [5, 3], 
  3 => [5, 2], 
  4 => [1], 
  5 => [2, 3]
})
# => false

puts connected_graph?({
  0 => [1, 2], 
  1 => [0, 2], 
  2 => [0, 1, 3, 4, 5], 
  3 => [2, 4], 
  4 => [3, 2], 
  5 => [2]
})
# => true

