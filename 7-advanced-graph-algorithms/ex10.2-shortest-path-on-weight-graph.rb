require 'benchmark/ips'

def shortest_path_wg(matrix)
  start = 0
  result = []
  for target in 0..matrix.size-1
    # p "#{target} --- "
    result << find_shortest_path(matrix, start, target)
  end
  result    
end

def find_shortest_path(matrix, start, dest, cost=0, visited=[0])
  # p "start=#{start} -- cost=#{cost} -- #{visited}"
  return cost if start == dest 

  distant = Float::INFINITY

  matrix[start].each_with_index do |value, idx|
    if value != 0 && !visited.include?(idx)
      temp = find_shortest_path(matrix, idx, dest, cost+value, visited + [idx]) 
      distant = temp if distant > temp
    end
  end
  distant
end

#####################
# Yunus' solution

def shortest_path_wg_y(matrix)
  res = Array.new(matrix.size, 0)
  solved = [0]
  abs_dist = {0=>0}
  
  until solved.size == matrix.size
  
    distances = Hash.new(999)
    
    solved.each do |node| 
      matrix[node].each_with_index do |dis, nod| 
        distances[nod] = (dis + abs_dist[node]) if dis > 0 && 
        !solved.include?(nod) && (dis + abs_dist[node]) < distances[nod]
      end
    end
    
    min = distances.values.min
    solved << distances.key(min)
    res[solved.last] = min
    abs_dist[solved.last] = min
    
  end
  res
end


p shortest_path_wg_y([[0, 0, 1, 3, 0, 0], 
                    [0, 0, 0, 5, 0, 0], 
                    [1, 0, 0, 2, 1, 4], 
                    [3, 5, 2, 0, 7, 0],
                    [0, 0, 1, 7, 0, 2], 
                    [0, 0, 4, 0, 2, 0]])
# => [0, 8, 1, 3, 2, 4]

# p shortest_path_wg([[0, 3, 5], [3, 0, 1], [5, 1, 0]])
# => [0, 3, 4]

# p shortest_path_wg([[0, 3, 6, 0, 0, 10], [3, 0, 4, 1, 0, 0], [6, 4, 0, 3, 5, 4], [0, 1, 3, 0, 2, 0], [0, 0, 5, 2, 0, 3], [10, 0, 4, 0, 3, 0]])
# => [0, 3, 6, 4, 6, 9]

# p shortest_path_wg([[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]])
# => [0, 3, 5, 4, 6, 7, 4]

# matrix = [[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0],[0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]]

# matrix = [[0, 3, 5], [3, 0, 1], [5, 1, 0]]

# matrix = [[0, 3, 6, 0, 0, 10], [3, 0, 4, 1, 0, 0], [6, 4, 0, 3, 5, 4], [0, 1, 3, 0, 2, 0], [0, 0, 5, 2, 0, 3], [10, 0, 4, 0, 3, 0]]

matrix = [[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]]


Benchmark.ips do |x|
  x.config(:time => 3, :warmup => 2)
  
  x.report("Kelvin's Method") {shortest_path_wg(matrix)}
  x.report("Yunus's Method") {shortest_path_wg_y(matrix)}
  # x.report("Ebuka's Method") {weighted_graphs_e(matrix)}

  x.compare!    
end