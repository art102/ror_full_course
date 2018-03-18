fibonacci_row = [1, 1]

while fibonacci_row.max < 100
  number = fibonacci_row[-1] + fibonacci_row[-2]
  fibonacci_row << number 
end

fibonacci_row.delete(fibonacci_row.max) if fibonacci_row.max > 100

puts 'This is fibonacci row:'
p fibonacci_row

