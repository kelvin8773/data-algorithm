def merge_sort(array1, array2)
  index = 0
  until array2.size < 1 
    array2[0].to_i < array1[index].to_i ? array1.insert(index, array2.shift) 
                  : index >= array1.size-1 ? (array1 = array1 + array2; break) : index += 1
  end
  return array1  
end

def full_merge_sort(array)
  def helper(array)
    return array if array.size <= 1
    merge_sort(helper(array[0...array.size/2]), helper(array[array.size/2..-1]))
  end
  helper(array).map{|x| x.split(' ').last}
end

p full_merge_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
