def balanced_brackets?(string)
  # your code here
  stack = []
	opening = ['(', '[', '{']
	closing = [')', ']', '}']
	
	string.chars.each do |character|
		if opening.include?(character)
			stack << character
		elsif closing.include?(character)
			value = stack.pop
			return false if opening.index(value) != closing.index(character)
		end
	end
	
	stack.empty?
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true
