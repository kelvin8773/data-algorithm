# @param {String} s
# @param {String} t
# @return {String}

def min_window(s, t)
  current_set = {}
  t.each_char do |c|
      current_set[c] ||= 0
      current_set[c] -= 1
  end
  valid_count = current_set.keys.length * -1
  p valid_count
  p current_set
  left = 0
  min_window = ""
  s.each_char.with_index do |c, right_index|
      if current_set[c]
          current_set[c] += 1
          valid_count += 1 if current_set[c] == 0
      end
      if valid_count >= 0
          while valid_count >= 0
              if current_set[s[left]]
                  current_set[s[left]] -= 1
                  valid_count -= 1 if current_set[s[left]] == -1
              end
              left += 1
          end
          if min_window.length == 0 || min_window.length >= right_index - left + 2
              min_window = s[left-1..right_index]
          end
      end
  end
  min_window
end


p min_window("ADOBECODEBANC", "ABC")