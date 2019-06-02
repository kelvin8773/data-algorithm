
def find_peaks(map, row, col)
  me = map[row][col]
  top = row-1 >=0 ? map[row-1][col]:nil
  down = row+1 < map.size ? map[row+1][col]:nil
  left = col-1 >= 0 ? map[row][col-1]:nil
  right = col+1 < map[0].size ? map[row][col+1]:nil
  max_around = [top, down, left, right, me].compact.max 
    
  case max_around
    when top
      next_position = [row-1, col]
    when down
      next_position = [row+1, col]
    when left
      next_position = [row, col-1]
    when right
      next_position = [row, col+1]
    when me
      next_position = [row, col]
   end

   if next_position[0] == row && next_position[1] == col
      return map[row][col]
   end
    
   find_peaks(map, next_position[0], next_position[1])
end

def greatest_peaks(map)
   row = map.size - 1
   col = map[0].size - 1
   peaks_areas = Hash.new
   areas = []

   for i in 0..row
    for j in 0..col
      peak = find_peaks(map, i, j)
      if !peaks_areas[peak]
        peaks_areas[peak] = []
      end
      peaks_areas[peak] << map[i][j]
    end
  end

  for key in peaks_areas.keys
    areas << peaks_areas[key].size
  end
  
  return [areas.min, areas.max]

end


p greatest_peaks(
  [
    [9, 8, 5], 
    [5, 6, 3], 
    [8, 4, 1]
  ]
)
# => [3, 6]

p greatest_peaks(
  [
    [8, 12], 
    [9, 3]
  ]
)
# # => [1, 3]

p greatest_peaks(
  [
    [2, 6, 9, 11], 
    [7, 8, 9,  8], 
    [6, 7, 12, 9],
    [10, 7, 6, 4]
  ]
)
# # => [3, 9]

