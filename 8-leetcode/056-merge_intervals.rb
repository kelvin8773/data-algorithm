# @param {Integer[][]} intervals
# @return {Integer[][]}

def merge(intervals)
  intervals = intervals.sort_by {|x| x.first }
  start=finish=i=0
  overlap, result = false, []

  while i < intervals.size do 
    if !overlap
      start = intervals[i][0] 
      finish = intervals[i][1] 
    end
    
    if i < intervals.size-1 && finish >= intervals[i+1][0]
      finish = intervals[i+1][1] if finish < intervals[i+1][1] 
      overlap = true
    else
      result << [start, finish]
      overlap = false
    end   
      i += 1
  end
  result    
end

p merge([[1,3],[2,6],[8,10],[15,18]])

# p merge([[1,4],[4,5]])

p merge([[1,4],[2,3]])