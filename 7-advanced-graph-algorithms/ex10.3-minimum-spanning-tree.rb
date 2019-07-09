require 'benchmark/ips'

def minimum_spanning_tree(matrix) # connect all the nodes
  solved, path =[0], []

  until solved.size == matrix.size
    min_dist, next_node = find_minimum_distant(matrix, solved) 
    path << min_dist
    solved << next_node
  end
  path 

end

def find_minimum_distant(matrix, solved)
  min_dist = Float::INFINITY
  next_node = 0

  solved.each do |x|
    matrix[x].each_with_index do |d, idx|
      if d != 0 && !solved.include?(idx)      
        (min_dist = d; next_node = idx )if min_dist > d
      end
    end
  end
  return [min_dist, next_node]
end

###########

def minimum_spanning_tree_y(matrix)
  res = []
   solved = [0]
   until solved.size == matrix.size
    
     distances = Hash.new(999)
     
     solved.each do |node| matrix[node].each_with_index do |dis, nod| 
       distances[nod] = dis if dis > 0 && 
       !solved.include?(nod) && dis < distances[nod]
       end
     end
 
     min = distances.values.min
     solved.unshift distances.key(min)
     res << min
     
   end
   res
   
 end

p minimum_spanning_tree([
  [0, 4, 1, 4, 0, 0, 0, 0, 0, 0], 
  [4, 0, 5, 0, 9, 9, 0, 7, 0, 0], 
  [1, 5, 0, 3, 0, 0, 0, 9, 0, 0], 
  [4, 0, 3, 0, 0, 0, 0, 10, 0, 18], 
  [0, 9, 0, 0, 0, 2, 4, 0, 6, 0], 
  [0, 9, 0, 0, 2, 0, 2, 8, 0, 0], 
  [0, 0, 0, 0, 4, 2, 0, 9, 3, 9], 
  [0, 7, 9, 10, 0, 8, 9, 0, 0, 8], 
  [0, 0, 0, 0, 6, 0, 3, 0, 0, 9], 
  [0, 0, 0, 18, 0, 0, 9, 8, 9, 0]
  ])
# => [1, 3, 4, 7, 8, 2, 2, 3, 8]

p minimum_spanning_tree([
  [0, 0, 1, 3, 0, 0], 
  [0, 0, 0, 5, 0, 0], 
  [1, 0, 0, 2, 1, 4], 
  [3, 5, 2, 0, 7, 0], 
  [0, 0, 1, 7, 0, 2], 
  [0, 0, 4, 0, 2, 0]
  ])
# => [1, 1, 2, 2, 5]

p minimum_spanning_tree([[0, 3, 5], [3, 0, 1], [5, 1, 0]])
# => [3, 1]

p minimum_spanning_tree([[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]])
# => [3, 1, 2, 3, 1, 3]

p minimum_spanning_tree([[0, 4, 1, 4, 0, 0, 0, 0, 0], [4, 0, 5, 0, 9, 5, 0, 7, 0], [1, 5, 0, 3, 0, 0, 0, 9, 0], [4, 0, 3, 0, 0, 0, 0, 7, 0], [0, 9, 0, 0, 0, 2, 4, 0, 6], [0, 5, 0, 0, 2, 0, 2, 8, 0], [0, 0, 0, 0, 4, 2, 0, 9, 3], [0, 7, 9, 7, 0, 8, 9, 0, 0], [0, 0, 0, 0, 6, 0, 3, 0, 0]])
# => [1, 3, 4, 5, 2, 2, 3, 7]


matrix1 = [[0, 3, 5], [3, 0, 1], [5, 1, 0]]

matrix2 = [[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]]

matrix3 = [[0, 4, 1, 4, 0, 0, 0, 0, 0], [4, 0, 5, 0, 9, 5, 0, 7, 0], [1, 5, 0, 3, 0, 0, 0, 9, 0], [4, 0, 3, 0, 0, 0, 0, 7, 0], [0, 9, 0, 0, 0, 2, 4, 0, 6], [0, 5, 0, 0, 2, 0, 2, 8, 0], [0, 0, 0, 0, 4, 2, 0, 9, 3], [0, 7, 9, 7, 0, 8, 9, 0, 0], [0, 0, 0, 0, 6, 0, 3, 0, 0]]

matrix4 = [ [0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0] ]

matrix5 = [
  [0, 4, 1, 4, 0, 0, 0, 0, 0, 0], 
  [4, 0, 5, 0, 9, 9, 0, 7, 0, 0], 
  [1, 5, 0, 3, 0, 0, 0, 9, 0, 0], 
  [4, 0, 3, 0, 0, 0, 0, 10, 0, 18], 
  [0, 9, 0, 0, 0, 2, 4, 0, 6, 0], 
  [0, 9, 0, 0, 2, 0, 2, 8, 0, 0], 
  [0, 0, 0, 0, 4, 2, 0, 9, 3, 9], 
  [0, 7, 9, 10, 0, 8, 9, 0, 0, 8], 
  [0, 0, 0, 0, 6, 0, 3, 0, 0, 9], 
  [0, 0, 0, 18, 0, 0, 9, 8, 9, 0]
  ]

matrix_arr = [matrix1, matrix2, matrix3, matrix4, matrix5]

for matrix in matrix_arr
p "Benchmark-test with #{matrix}"
  Benchmark.ips do |x|
    x.config(:time => 3, :warmup => 2)
    
    x.report("Kelvin's Method") {minimum_spanning_tree(matrix)}
    x.report("Yunus's Method") {minimum_spanning_tree_y(matrix)}

    x.compare!    
  end

end