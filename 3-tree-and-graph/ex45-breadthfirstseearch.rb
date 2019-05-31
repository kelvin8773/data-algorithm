def bfs(graph)
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
    p queue
    visited << key  
  end

return visited 
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