def max_around(map, row, col)
  top = row-1 >=0 ? map[row-1][col]:nil
  down = row+1 < map.size ? map[row+1][col]:nil
  left = col-1 >= 0 ? map[row][col-1]:nil
  right = col+1 < map[0].size ? map[row][col+1]:nil
  max_around = [top, down, left, right].compact.max 

end

def greatest_peaks(map, row=0, col=0, peak_areas=Hash.new, peak=nil)
  return map[row][col] if map[row][col] > max_around(map, row, col)
  return false if map[row][col] == nil
   
  peak = greatest_peaks(map, row+1, col, peak_areas[peak].concat([map[row][col]]))
  
  if peak != nil
    peak_areas[peak] = [map[]] 


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
# => [1, 3]

p greatest_peaks(
  [
    [2, 6, 9, 11], 
    [7, 8, 9,  8], 
    [6, 7, 12, 9],
    [10, 7, 6, 4]
  ]
)
# => [3, 9]

