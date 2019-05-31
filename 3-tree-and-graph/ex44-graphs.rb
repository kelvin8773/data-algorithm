def graph(hash_graph)

  def helper(hash, key=0, res=[0])
    p "#{hash},--------, #{key},#{res}"
    return true if key == 4
    return false if hash[key] == nil || res.include?(hash[key][0])
    
    if hash[key] != nil
      list = hash[key]
      for value in list do 
        # if !res.include?(value) 
          if helper(hash.tap{|h| h.delete(key)}, value, res.concat([value])) 
            return res
          end
          res.pop
        # end
      end
      hash[key] = list
      # p "#{hash},--------, #{key},#{res}"
    end

  end

  helper(hash_graph)
end

hash = { 
  0 => [2], 
  1 => [4], 
  2 => [3, 0, 5], 
  3 => [6, 5], 
  4 => [1, 5], 
  5 => [7, 0, 4, 8],
  6 => [2],
  7 => [2]
}

p graph(hash)
# => [0, 2, 5, 4]
