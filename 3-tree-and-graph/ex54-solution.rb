def depth_first_search(graph)
  result = []
  stack = [0]
  visited = []
  
  while stack.size != 0
    head = stack.pop
    result << head
    visited << head
    
    not_visited = graph[head].reject { |node| visited.include? node }
    
    visited += not_visited
    stack += not_visited.reverse
  end
  
  result
end

def connected_graph?(graph)
  graph.keys.size == depth_first_search(graph).size
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
  0 => [1, 2], 
  1 => [0, 2], 
  2 => [0, 1, 3, 4, 5], 
  3 => [2, 4], 
  4 => [3, 2], 
  5 => [2]
})
# => true