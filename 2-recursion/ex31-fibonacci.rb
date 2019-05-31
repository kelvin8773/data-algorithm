# work but take long time if run to 100
def fibonacci(n)
  if n < 2
    n
  else  
    fibonacci(n-1) + fibonacci(n-2)
  end
end


# puts fibonacci(100)

# Better code with memorization

@fib_hash = {}

def best_fib(n) 
  @fib_hash[n] =                                                                    
    if n <= 1                                                                       
      n                                                                             
    else 
      @fib_hash[n] ||= best_fib(n-1) + best_fib(n-2)                                
    end                                                                              
end 

puts best_fib(7000)