# @param {Character[][]} matrix
# @return {Integer}

def maximal_rectangle(matrix)
  row = matrix.size
  return 0 if row == 0
  col = matrix.first.size
  max_area = 0
  heights = Array.new(col, 0)

  for i in 0...row do
    for j in 0...col do
      matrix[i][j] == "0" ? (heights[j] = 0) : (heights[j] += 1)
    end
    area = largest_rectangle_area(heights)
    max_area = area if max_area < area
  end
  max_area
end

def largest_rectangle_area(heights)
  max_area = area = 0
  stack = []
  i = 0

  while i < heights.size do 
    if stack.empty? || heights[stack.last] <= heights[i]
      stack << i
      i += 1
    else
      top = stack.pop
      area = stack.empty? ? heights[top]*i : heights[top]*(i - stack.last - 1)
      max_area = area if max_area < area
    end
  end

  while !stack.empty?
    top = stack.pop
    area = stack.empty? ? heights[top]*i : heights[top]*(i - stack.last - 1)
    max_area = area if max_area < area
  end
  max_area
end

matrix = [
  ["1","0","1","0","0"],
  ["1","0","1","1","1"],
  ["1","1","1","1","1"],
  ["1","0","0","1","0"]
]

p maximal_rectangle(matrix)