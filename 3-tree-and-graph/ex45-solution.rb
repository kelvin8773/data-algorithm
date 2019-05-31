def bfs(graph)
  # write your code here
  queue = [0]
  result = []
  visited = []
  
  until queue.empty?
    head = queue.shift
    result << head
    visited << head
    
    not_visited = graph[head].reject { |node| visited.include? node }
    
    visited += not_visited
    queue += not_visited
  end
  
  result
end

p bfs({
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
})
# => [0, 2, 5, 3, 4, 1]