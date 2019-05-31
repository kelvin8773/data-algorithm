def greatest_peaks(map)
  peak = 0
  peak_areas = { peak => []}

  for i in 0..map.size-1
    for j in 0..map[0].size-1

      top = i-1 >= 0 ?  map[i-1][j]:nil 
      down = i+1 < map.size ? map[i+1][j]:nil
      left = j-1 >= 0 ? map[i][j-1]:nil
      right = j+1 < map[0].size ? map[i][j+1]:nil
      max_around = [top, down, left, right].compact.max

      
      if map[i][j] > max_around 
        peak = map[i][j]
        if peak_areas.keys[0] == 0
          peak_areas[peak] = peak_areas.delete(0) # only for first time
        else 
          peak_areas[peak] =  [map[i][j]]
        end
      end
        peak_areas[peak] << map[i][j] 
           
    end
  end

  peak_areas 
  # return [peak_areas.min[1].size, peak_areas.max[1].size]

end

# p greatest_peaks(
#   [
#     [9, 8, 5], 
#     [5, 6, 3], 
#     [8, 4, 1]
#   ]
# )
# => [3, 6]

p greatest_peaks(
  [
    [8, 12], 
    [9, 3]
  ]
)
# => [1, 3]