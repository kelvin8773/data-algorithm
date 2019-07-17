# @param {String} s
# @param {Integer} num_rows
# @return {String}

def convert(s, num_rows)
  return s if num_rows == 1
  cur_row, going_down = 0, false
  rows = Array.new(num_rows, [])

  s.each_char do |x|
    rows[cur_row] += [x]
    going_down = !going_down if cur_row == 0 || cur_row == num_rows - 1
    cur_row += going_down ? 1 : -1
  end 

  rows.join
end

p convert("PAYPALISHIRING", 3)
p convert("PAYPALISHIRING", 4)
