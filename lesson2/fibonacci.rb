fibonacci_row = [1, 1]

loop do
  number = fibonacci_row[-1] + fibonacci_row[-2]
  fibonacci_row << number
  break if fibonacci_row.last > 100
end

puts 'Thihs is fibonacci row:'
print fibonacci_row
puts ""
