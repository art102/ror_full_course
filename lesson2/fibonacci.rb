fibonacci_row = [1, 1]

loop do
  number = fibonacci_row[-1] + fibonacci_row[-2]
  break if number > 100
  fibonacci_row << number
  
end

puts 'Thihs is fibonacci row:'
print fibonacci_row
puts ""
