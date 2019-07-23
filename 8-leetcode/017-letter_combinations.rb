# @param {String} digits
# @return {String[]}

def letter_combinations(digits)
  @table = { "2"=>['a','b','c'], 
            "3"=>['d','e','f'],
            "4"=>['g','h','i'],
            "5"=>['j','k','l'],
            "6"=>['m','n','o'],
            "7"=>['p','q','r','s'],
            "8"=>['t','u','v'],
            "9"=>['w','x','y','z']
          }
  @output = [] 

  def helper(combination, next_digits)
    return @output << combination if next_digits.size == 0
    
    @table[next_digits[0]].each do |x|
      
      helper(combination+x, next_digits[1..-1])
    end

    return @output
  end
     
  digits.size > 0 ?  helper("", digits) : @output

end


p letter_combinations("23")
# => ["ad","ae","af","bd","be","bf","cd","ce","cf"]

p letter_combinations("2")

p letter_combinations("")