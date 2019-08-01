# @param {String} s
# @param {String} p
# @return {Boolean}

# trick solution

def is_match_s(s, p)
  s.scan(Regexp.new(p)).first == s   
end

# Recurison 

def is_match_r(s, p)
  return s.nil? if p.nil? 
  first_match = !s.nil? && (s[0] == p[0] || p[0] == '.')
  
  if p.size >=2 && p[1] == "*"
    return is_match(s, p[2..-1]) || (first_match && is_match(s[1..-1], p))
  else
    return first_match && is_match(s[1..-1], p[1..-1])
  end
end

# Dynamic Programming

def is_match(s, p)
  s = s.bytes
  p= p.bytes
  dp = Array.new(s.length+1) { Array.new(p.length+1, false) }
  m, n = s.length, p.length
  dp[m][n] = true
  m.downto(0) do |i| 
    (n-1).downto(0) do |j| 
      first = i < m && (s[i] == p[j] || p[j] == 46)
      if p[j+1] == 42
        dp[i][j] = dp[i][j+2] || (first && dp[i+1][j])
      else
        dp[i][j] = first && dp[i+1][j+1]
      end
    end
  end
  dp[0][0]
end



p is_match("aa", "a")
p is_match("aa", "a*")
# p is_match("ab", ".*")
p is_match("aab", "c*a*b")
p is_match("mississippi", "mis*is*p*.")

p is_match("ab", ".*c")


