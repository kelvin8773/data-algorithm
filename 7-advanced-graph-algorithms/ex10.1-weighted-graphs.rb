def depth_first_search(graph, key=0, res=[0], dest)
  p "------- #{key},-------- #{res} ---- #{dest}" # Not necessary but good for analysis
  return res.size-1 if res.include? dest
 
  res << key    
  for value in graph[key]
    if !res.include? value
      depth_first_search(graph, value, res, dest)  #it go all the way down until it find sth duplicated.       
    end
  end
  return res.size-1

end


def weighted_graphs(matrix)
  # converting matrix to a graph hash
  graph = Hash.new
  matrix.each_with_index do |x, i|
    graph[i] = []
    x.each_with_index {|y, index| graph[i] << index if y != 0 }
  end

  result = []
  matrix.each_with_index do |x, index|
    p index
    result << depth_first_search(graph, index)
    p "---------------------------------"
  end
  
  result

end

p weighted_graphs([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])

# graph = { 0=>[2, 3], 
#           1=>[3], 
#           2=>[0, 3, 4, 5], 
#           3=>[0, 1, 2, 4], 
#           4=>[2, 3, 5], 
#           5=>[2, 4]
#         }

# => [0, 2, 1, 1, 2, 2]