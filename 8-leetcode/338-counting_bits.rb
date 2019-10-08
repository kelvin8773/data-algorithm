# @param {Integer} num
# @return {Integer[]}

def count_bits(num)
  res = []
  for i in 0..num do
    res << i.to_s(2).count("1")
  end
  res
end