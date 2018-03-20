fibonacci_row = [1, 1]

while fibonacci_row.max < 100
  number = fibonacci_row[-1] + fibonacci_row[-2]
  break if number > 100
  fibonacci_row << number 
end

puts 'This is fibonacci row:'
p fibonacci_row

