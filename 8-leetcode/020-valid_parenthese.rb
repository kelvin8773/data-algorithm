# @param {String} s
# @return {Boolean}

def is_valid(s)
  opening = ['(', '{', '[']
  closing = [')', '}', ']']
  keep = []

  s.each_char do |x|
    if opening.include?(x)
      keep << x
    elsif closing.include?(x)
      if closing.index(x) != opening.index(keep.pop)
        return false
      end 
    end
  end

  keep.empty?
end

p is_valid("()")
# => true

p is_valid('()[]{}')
# => true

p is_valid("([)]")
# => false

p is_valid("{[]}")
# => true

p is_valid("([)")
# => false