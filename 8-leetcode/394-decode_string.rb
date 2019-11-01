# @param {String} s
# @return {String}

def decode_string(s, decode_str='')
  
  def get_string(str)
    return str unless str.include?("[") 
    
    stack = 1
    start = finish = str.index("[") 
    
    while stack > 0 && finish < str.size
      finish += 1
      stack +=1 if str[finish] == "["
      stack -=1 if str[finish] == "]"
    end
    
    str[start+1...finish]
  end
  
  return s unless s.include?('[')
  
  i = 0
  result = ""
  
  while i < s.size
    if s[i].match(/[0-9]/)
      k = s[i..-1].match(/^[0-9]+/).to_s
      str = get_string(s[i..-1])
      
      decode_str = decode_string(str, decode_str) * k.to_i
      result += decode_str
      i += k.size + str.size + 2
    else
      result += s[i]
      i += 1
    end
  end
  
  result
end