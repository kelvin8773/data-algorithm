# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.

def rotate_r(matrix)
  matrix.replace(matrix.reverse.transpose)
end

def rotate(matrix)
  n = matrix.size
    # Flip diagonal
    for i in 0...n do 
      for j in i...n do 
          matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j] 
       end
    end
    
    # # Flip horizontal
    for i in 0...n do 
      for j in 0...n/2 do
          matrix[i][j], matrix[i][n - j - 1] = matrix[i][n - j - 1], matrix[i][j]
       end
    end
    matrix
end


matrix1 = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

matrix2 = [
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
]

p rotate(matrix1)