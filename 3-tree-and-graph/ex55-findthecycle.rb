def graph_cycle?(graph, key=0, res=[0])
    p "#{graph}, ----, #{key},----, #{res}, ----, #{res[-3]}"

    return true if res.uniq.length != res.size && key != res[-3]
    return false if graph[key] == nil 
    
    if graph[key] != nil
      list = graph[key]
      for value in list do 
          if graph_cycle?(graph.tap{|h| h.delete(key)}, value, res.concat([value])) 
            return true
          end
          res.pop
      end
      graph[key] = list
    end
    false
end

puts graph_cycle?({
  0=>[2], 
  1=>[4], 
  2=>[0, 5, 3], 
  3=>[5, 2], 
  4=>[5, 1], 
  5=>[4, 2, 3]
})
# => true

puts graph_cycle?({
  0=>[2], 
  1=>[2], 
  2=>[0, 1, 3, 4, 5], 
  3=>[2], 
  4=>[2]
})
# => false