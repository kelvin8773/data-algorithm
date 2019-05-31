# Depth First Search Solution

def depth_first_search(graph, key=0, res=[])
    p "#{graph}, ------- #{key},-------- #{res}" # Not necessary but good for analysis
    return if res.include? key
   
    res << key    
    for value in graph[key]
      if !res.include? value
        depth_first_search(graph, value, res)  #it go all the way down until it find sth duplicated.       
      end
    end
    return res
end

p depth_first_search({
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2, 6], 
  4 => [1, 5], 
  5 => [4, 2],
  6 => [3]
})
# => [0, 2, 5, 4, 1, 3]