# @param {String} s
# @param {String} p
# @return {Boolean}

def is_match(s, p)
  j = 0
  temp = ""

  for i in 0..s.size-1 do 
    
    if p[j] == s[i] || p[j] == '.' 
      j += 1
      temp = s[i] if s[i] != '.'
      next
    end

    if p[j] == '*' && s[i] == temp
      # j += 1
      next
    end


    if (p[j] != s[i] && p[j+1] == '*') 
      j += 2
      next
    end

    return false if p[j] != s[i]
  end  
  p p[j]
    
  return false if p.size - j > 0
  true
    
end

# p is_match("aa", "a")
# p is_match("aa", "a*")
# p is_match("ab", ".*")
p is_match("aab", "c*a*b")
# p is_match("mississippi", "mis*is*p*.")

p is_match("ab", ".*c")


