# @param {Integer[][]} grid
# @return {Integer}

# bruce force solution can't pass time limit

def min_path_sum_b(grid)
  def helper(row, col, grid, sum=0, result=[])
    if [row, col] == [grid.size-1, grid[0].size-1]
           sum += grid[row][col] 
           result << sum
           return result
    end

    if row <= grid.size-1 && col <= grid[0].size-1
      result = helper(row, col+1, grid, sum + grid[row][col], result)
      result = helper(row+1, col, grid, sum + grid[row][col], result)
    end  
    result
  end

  res = helper(0,0,grid)
  p res.size
  res.min
end

def min_path_sum(grid)
  row = grid.size
  col = grid.first.size
  
  (0...row).each do |i|
    (0...col).each do |j|
      next if (i == 0) && (j == 0)    
      row_val = (i - 1) < 0 ? grid[i][j-1] : grid[i-1][j]
      col_val = (j - 1) < 0 ? grid[i-1][j]: grid[i][j-1]
      
      grid[i][j] += [row_val, col_val].min    
    end
  end
  grid.last.last 
end

grid = [[1,3,1],
        [1,5,1],
        [4,2,1]]

grid1 = [[1]]

grid2 = [ [7,1,3,5,8,9,9,2,1,9,0,8,3,1,6,6,9,5],
          [9,5,9,4,0,4,8,8,9,5,7,3,6,6,6,9,1,6],
          [8,2,9,1,3,1,9,7,2,5,3,1,2,4,8,2,8,8],
          [6,7,9,8,4,8,3,0,4,0,9,6,6,0,0,5,1,4],
          [7,1,3,1,8,8,3,1,2,1,5,0,2,1,9,1,1,4],
          [9,5,4,3,5,6,1,3,6,4,9,7,0,8,0,3,9,9],
          [1,4,2,5,8,7,7,0,0,7,1,2,1,2,7,7,7,4],
          [3,9,7,9,5,8,9,5,6,9,8,8,0,1,4,2,8,2],
          [1,5,2,2,2,5,6,3,9,3,1,7,9,6,8,6,8,3],
          [5,7,8,3,8,8,3,9,9,8,1,9,2,5,4,7,7,7],
          [2,3,2,4,8,5,1,7,2,9,5,2,4,2,9,2,8,7],
          [0,1,6,1,1,0,0,6,5,4,3,4,3,7,9,6,1,9] ]

p min_path_sum(grid2)