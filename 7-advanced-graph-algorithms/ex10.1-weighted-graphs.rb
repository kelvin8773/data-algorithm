require 'benchmark/ips'

def depth_first_search(matrix, visit=[0], dest)
  return visit.size-1 if visit[-1] == dest 
  result = Float::INFINITY
  
  matrix[visit[-1]].each_with_index do |value, idx|
    if value != 0 && !visit.include?(idx)
      size = depth_first_search(matrix, visit + [idx], dest)  
      result = size if result > size
    end
  end
  result
end


def weighted_graphs(matrix)
  result = []
  for dest in 0..matrix.size-1
    result << depth_first_search(matrix, dest)
  end
  result
end


#########################
# ebuka's solution

def weighted_graphs_e(matrix)
  # write your code here
  count = 1
  found_stops = [0]
  not_visited = [[count,0]]
  visited = []
  while visited.size < matrix.first.size
    current = not_visited.pop
    to_visit = current.last
    level = current.first
    unless visited.include? to_visit
      count += 1
      stops = visit(matrix, to_visit)
      visited << to_visit
      stops.each { |stop| found_stops[stop] = level if found_stops[stop].nil? }
      not_visited = enqueue(not_visited, stops, count)
    end
  end
  found_stops
end

def enqueue(old, new, count)
  old.unshift([count, new.pop]) until new.empty?
  old
end

def visit(matrix, row)
  found = []
  matrix[row].each_with_index { |stop, index| found << index unless stop.zero? }
  found
end

############################
# Yunus' Solution

def weighted_graphs_y(matrix)

  result=Array.new(matrix.size, 0)
  que=["0 level", 0]
  visited = []
  level = 0
 until que.empty?
 
   i = que.shift
   if i.class == String
     level = i.to_i + 1
   else
  visited << i
  matrix[i].each_with_index do |node, ind| 
  if !visited.include?(ind) && !que.include?(ind) && node > 0
    que << "#{level} level"
    que << ind
    result[ind] = level
  end
  end
end
 end
result
    
end


p weighted_graphs([
  [0, 0, 1, 3, 0, 0], 
  [0, 0, 0, 5, 0, 0], 
  [1, 0, 0, 2, 1, 4], 
  [3, 5, 2, 0, 7, 0], 
  [0, 0, 1, 7, 0, 2], 
  [0, 0, 4, 0, 2, 0]
])
# => [0, 2, 1, 1, 2, 2]

p weighted_graphs([
  [0, 3, 5], 
  [3, 0, 1], 
  [5, 1, 0]
])
# => [0, 1, 1]

p weighted_graphs([
  [0, 3, 6, 0, 0, 9, 4], 
  [3, 0, 4, 1, 0, 0, 0], 
  [6, 4, 0, 3, 5, 4, 1], 
  [0, 1, 3, 0, 2, 0, 0], 
  [0, 0, 5, 2, 0, 3, 0], 
  [9, 0, 4, 0, 3, 0, 3], 
  [4, 0, 1, 0, 0, 3, 0]
])
# => [0, 1, 1, 2, 2, 1, 1]


p weighted_graphs([ [0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
                    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [1, 0, 0, 0, 1, 1, 0, 0, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                    [0, 0, 1, 1, 0, 0, 1, 0, 0, 0],
                    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 1, 1, 0],
                    [0, 0, 0, 0, 0, 1, 1, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
                    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0] ])
  
# => [0, 1, 1, 3, 2, 2, 3, 3, 4, 1]

# matrix = [
#   [0, 3, 6, 0, 0, 9, 4], 
#   [3, 0, 4, 1, 0, 0, 0], 
#   [6, 4, 0, 3, 5, 4, 1], 
#   [0, 1, 3, 0, 2, 0, 0], 
#   [0, 0, 5, 2, 0, 3, 0], 
#   [9, 0, 4, 0, 3, 0, 3], 
#   [4, 0, 1, 0, 0, 3, 0]
# ]

matrix = [[0, 1, 1, 0, 0, 0, 0, 0, 0, 1],
          [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [1, 0, 0, 0, 1, 1, 0, 0, 0, 0],
          [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
          [0, 0, 1, 1, 0, 0, 1, 0, 0, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 1, 0, 0, 1, 1, 0],
          [0, 0, 0, 0, 0, 1, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
          [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

Benchmark.ips do |x|
  x.config(:time => 3, :warmup => 2)
  
  x.report("Kelvin's Method") {weighted_graphs(matrix)}
  x.report("Yunus's Method") {weighted_graphs_y(matrix)}
  x.report("Ebuka's Method") {weighted_graphs_e(matrix)}

  x.compare!    
end



