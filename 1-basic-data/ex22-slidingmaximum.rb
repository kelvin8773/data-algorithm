def sliding_maximum(k, array)
  arr = [];
  for i in 0..(array.length-k) do
  	arr.push(array[i..(i+k-1)].max)
  end
	arr
end

p sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]
