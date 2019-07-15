# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
    res = 0
    sub_string = []
    
  s.split("").each do |x|
    temp = 0
    if sub_string.include?(x) 
      temp = sub_string.size; 
      sub_string = sub_string[sub_string.index(x)+1..-1]
    end
    sub_string << x
    res = temp if res < temp
  end

  # p sub_string

  res < sub_string.size ? sub_string.size : res 

    
end

p length_of_longest_substring("abcabcbb")

p length_of_longest_substring("bbbbbbb")

p length_of_longest_substring("pwwkew")

p length_of_longest_substring("dvdf")

p length_of_longest_substring("")
