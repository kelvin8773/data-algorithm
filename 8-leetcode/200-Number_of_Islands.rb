# @param {Character[][]} grid
# @return {Integer}

def num_islands(grid)
  count = 0
  def check_around(grid, row, col )
    p [grid, row, col] 
    return if   row < 0 || 
                col < 0 ||  
                row > grid.size - 1 || 
                col > grid.first.size - 1 || 
                grid[row][col] == '0' || 
                grid[row][col] == 'V'
                
    grid[row][col] = 'V' if grid[row][col] = '1'
    check_around(grid, row+1, col)
    check_around(grid, row-1, col)
    check_around(grid, row, col+1)
    check_around(grid, row, col-1)
  end
  
  for i in 0...grid.size
    for j in 0...grid.first.size 
      if grid[i][j] == '1'
        count += 1
        check_around(grid, i, j)
        p "break ################"
      end
    end
  end
  
  count
end

grid = [["1","1","1","1","0"],
        ["1","1","0","1","0"],
        ["1","1","0","0","0"],
        ["0","0","0","0","0"]]

grid1 = [["1","0","1","1","0","1","1"]]

# p num_islands(grid)
# 1

p num_islands(grid1)
# 3

