# @param {String} s
# @return {Integer}

# Brute Force
def longest_valid_parentheses_b(s)
  maxlen = 0
  
  def valided?(str)
    stack = []
    str.each_char do |x|
      if x == '('
        stack << x 
      elsif !stack.empty? && stack.max == '('
        stack.pop
      else
        return false
      end
    end
    stack.empty?
  end
  
  for i in 0..s.size-1 do
    for j in (i+2..s.size).step(2) do 
      maxlen = [maxlen, j-i].max if valided?(s[i..j-1])
    end
  end
  
  maxlen
end

# 


# Left & right approach

def longest_valid_parentheses_lr(s)
  left = right = maxlen = 0
  
  s.each_char do |x|   #left -> right
    left  += 1 if x == '('
    right += 1 if x == ')'
    
    if left == right
      maxlen = [maxlen, left*2].max
    elsif right > left
      left = right = 0
    end    
  end
  
  left = right = 0
  
  s.reverse.each_char do |x| # right -> left
     left  += 1 if x == '('
     right += 1 if x == ')'
    
    if left == right
      maxlen = [maxlen, right*2].max
    elsif left > right
      left = right = 0
    end
  end
  maxlen
end

# Stack

def longest_valid_parentheses(s)
  stack = [-1]
  max_len = 0
  
  s.each_char.with_index do |x, i|
    if x == '('
      stack << i 
    else
      stack.pop 
      stack.empty? ? (stack << i) : (max_len = [max_len, i - stack.last].max)
    end   
  end
  
  max_len
  
end

p longest_valid_parentheses('()')
# => 2

p longest_valid_parentheses('(((())(')
# => 2

p longest_valid_parentheses(')()())')
# => 4

p longest_valid_parentheses(')()()(')
# => 4
