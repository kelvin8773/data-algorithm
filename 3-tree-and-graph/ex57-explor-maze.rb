def maze_escape(maze, row=0, col=0, path=[])
  return false if row < 0 || col < 0 || row > maze.size-1 || col > maze[0].size-1 
  return false if maze[row][col] == 1 || path.include?([row, col]) 
  
  if maze[row][col] == 9
    path.unshift([col, row])
    return true
  end
  
  if maze_escape(maze, row+1, col, path) ||
    maze_escape(maze, row, col+1, path)  
    
    p "#{row} -- #{col} -- #{path}"

    path.unshift([col, row])
    return path 
  end

end

p maze_escape(
  [
    [0, 0, 0, 0, 0], 
    [0, 1, 0, 1, 0], 
    [0, 1, 0, 1, 1], 
    [0, 1, 0, 0, 0], 
    [0, 0, 0, 1, 9]
  ]
)
# => [ 
#      [0, 0],
#      [1, 0],
#      [2, 0],
#      [2, 1],
#      [2, 2],
#      [2, 3],
#      [3, 3],
#      [4, 3],
#      [4, 4]
#    ]
