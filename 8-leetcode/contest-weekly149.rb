# @param {String} date
# @return {Integer}

def day_of_year(date)
  year = date[0..3].to_i
  month = date[5..6].to_i
  day = date[8..9].to_i
  days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def leap_year?(year)
    year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
  end

  days = day

  if month > 1
    days += days_in_month[0..month-2].sum 
  end

  days += 1 if leap_year?(year) && month > 2
  days

end

p day_of_year("1900-03-25")
p day_of_year("2000-03-25")

###########################################################

# @param {Integer} d
# @param {Integer} f
# @param {Integer} target
# @return {Integer}

def num_rolls_to_target(d, f, target)
  return 0 if d * f < target || target == 0
  return 1 if d < 2 && target <= f

  d.time do 
    combination = []
    f.each do |x|
      combination << x
    end
  end

end

# p num_rolls_to_target(2, 6, 7)


###########################################################

# @param {String} text
# @return {Integer}

def max_rep_opt1(text)
  max_len = 0
  repet_len = 0 
  start = nil
  finish = nil

  for i in 1...text.size do
   if text[i-1] == text[i]
    repet_len += 1
   else 
    repet_len = 0
   end

   max_len = repet_len if max_len < repet_len

  end
    
end