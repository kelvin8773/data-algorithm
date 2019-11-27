# @param {Integer[]} prices
# @return {Integer}

def max_profit(prices)
  @count = 0
  def helper(prices, idx, profit, trans)
    if idx == prices.size
      # p "#{trans} + $#{profit}"
      @count += 1
      return profit
    end

    profit1 = profit2 = 0

    if trans.count('buy') == trans.count('sell')
      return 0 if profit.negative?

      if trans.empty? || trans[idx - 1] == 'cooldown'
        profit1 = helper(prices, idx + 1, profit - prices[idx], trans + ['buy'])
      end
      profit2 = helper(prices, idx + 1, profit, trans + ['cooldown'])
    elsif trans.count('buy') == trans.count('sell') + 1
      profit1 = helper(prices, idx + 1, profit + prices[idx], trans + ['sell']) 
      profit2 = helper(prices, idx + 1, profit, trans + ['cooldown'])
    end
    [profit1, profit2].max
  end

  helper(prices, 0, 0, [])
  p @count
end




p max_profit([1,2,4])
# 3

p max_profit([1,2,3,0,2])
# 3

p max_profit([1,2,4,2,5,7,2,4,9,0])
# 11

p max_profit([48,12,60,93,97,42,25,64,17,56,85,93,9,48,52,42,58,85,81,84,69,36,1,54,23,15,72,15,11,94])
# 428