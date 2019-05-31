def balanced_brackets?(string)
  stack = []
  string.gsub!(/\w/, "")
  for char in string.split('')
    if ['(', '{', '['].include? char
      stack.push(char)
    else
      if stack.empty?
        return false
      end
      top = stack.pop
      if (top == '(' && char != ')') || (top == '{' && char != '}' ) || (top == '[' && char != ']')
          return false
      end
    end
  end

  return stack.empty?
end

p balanced_brackets?('(hello)[world]')
# => true

p balanced_brackets?('([)]')
# # => false

p balanced_brackets?('[({}{}{})([])]')
# => true