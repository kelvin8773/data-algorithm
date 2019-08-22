# @param {String} word1
# @param {String} word2
# @return {Integer}

def min_distance(word1, word2)
  dp = Array.new(word1.size + 1) { Array.new(word2.size + 1) }
  for i in 0...dp.size
     dp[i][0] = i 
  end
  for j in 0...dp[0].size
      dp[0][j] = j
  end
  for i in 1...dp.size
      for j in 1...dp[0].size
          if word1[i - 1] == word2[j - 1]
              dp[i][j] = dp[i-1][j-1]
          else
              dp[i][j] = [
                  dp[i - 1][j],
                  dp[i][j - 1],
                  dp[i - 1][j - 1],
              ].min + 1
          end
      end
  end
  dp[-1][-1]
end


p min_distance("horse", "ros")

p min_distance("intention", "execution")