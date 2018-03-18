fibonacci_row = [1, 1]

while fibonacci_row.last < 100
  number = fibonacci_row[-1] + fibonacci_row[-2]
  fibonacci_row << number
  
end

puts 'This is fibonacci row:'
print fibonacci_row.first(fibonacci_row.size-1)
puts ""
