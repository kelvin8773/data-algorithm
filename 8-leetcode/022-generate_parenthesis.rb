# @param {Integer} n
# @return {String[]}

def generate_parenthesis_1(n)
  @ans = []
  @times = n
  
  def backtrack(str ='', left=0, right=0)
    return @ans << str if str.size == 2*@times
    backtrack(str+'(', left+1, right) if left < @times
    backtrack(str+')', left, right+1) if right < left
    @ans
  end  
  backtrack()
end

def generate_parenthesis(n)
  (1..n).inject([[""]]) { |acc, i|
      acc << (0...i).map { |x| acc[x].product(acc[i - x - 1]).map { |a, b| "(#{a})#{b}"} }.flatten
  }.last
end

p generate_parenthesis(3)
