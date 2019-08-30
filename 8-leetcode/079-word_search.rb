# @param {Character[][]} board
# @param {String} word
# @return {Boolean}

def exist(board, word)
    for i in 0...board.size do
      for j in 0...board.first.size do
        if board[i][j] == word[0]
          return true if search(board, i, j, 0, word)
        end
      end
    end 
    false
end

def search(board, row, col, count, word)
  return true if count == word.size

  if row < 0 || col < 0 || row > board.size-1  || col > board.first.size-1 || board[row][col] != word[count]
    return false
  end

  temp = board[row][col]
  board[row][col] = ""

  found = search(board, row+1, col, count+1, word) || 
          search(board, row-1, col, count+1, word) || 
          search(board, row, col+1, count+1, word) || 
          search(board, row, col-1, count+1, word)

  board[row][col] = temp
  found
end

# LeetCode Exlpain
# https://leetcode.com/problems/word-search/discuss/370618/Ruby-DFS-Solution-with-video-explain-Very-understandable


board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
word1 = 'ABCCED'  #true
word2 = 'SEE'     #true
word3 = "ABCB"    #false

board1 = 
[ ["C","A","A"],
  ["A","A","A"],
  ["B","C","D"] ]
word4 = "AAB"


p exist(board, word1)
# => true

p exist(board, word2)
# => true

p exist(board, word3)
# => false

p exist(board1, word4)
# => true