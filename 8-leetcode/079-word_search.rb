# @param {Character[][]} board
# @param {String} word
# @return {Boolean}

def exist_w(board, word)
    row = board.size
    col =board.first.size
    
    for i in 0...row do
      for j in 0...col do
        pos = 0
        if board[i][j] == word[pos]     
          cur_row = i
          cur_col = j
          pos += 1
          while (cur_row < row-1 && cur_row > 0) || (cur_col < col-1 && cur_col >0) || pos < word.size do
              if board[cur_row-1] && word[pos] == board[cur_row-1][cur_col] 
                cur_row -= 1
                pos += 1
              elsif board[cur_row] && word[pos] == board[cur_row][cur_col-1]
                cur_col -= 1
                pos += 1
              elsif board[cur_row+1] && word[pos] == board[cur_row+1][cur_col]
                cur_row += 1
                pos += 1
              elsif board[cur_row] && word[pos] == board[cur_row][cur_col+1]
                cur_col += 1
                pos += 1
              else
                break
              end
              p "#{pos} - #{cur_row} - #{cur_col}"
          end

          return true if pos == word.size

        end
      end
    end 

    false
end


def exist(board, word)
  board.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      return true if dfs(board, i, j, word)
    end
  end
  false
end

def dfs(board, row, col, word)
  return true if word.length == 0

  if row < 0 || row >= board.length || col < 0 || col >= board[0].length || board[row][col] != word[0]
    return false
  end

  temp = board[row][col]
  board[row][col] = ''

  result = dfs(board, row + 1, col, word[1..-1]) ||
           dfs(board, row - 1, col, word[1..-1]) ||
           dfs(board, row, col + 1, word[1..-1]) ||
           dfs(board, row, col - 1, word[1..-1])

  board[row][col] = temp

  return result
end


board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
word1 = 'ABCCED'  #true
word2 = 'SEE'     #true
word3 = "ABCB"    #false


# p exist(board, word1)
# => true
p exist(board, word2)

# p exist(board, word3)