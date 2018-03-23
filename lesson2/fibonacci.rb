fibonacci_row = [0, 1]
next_element = 1

while next_element < 100
  fibonacci_row << next_element
  next_element = fibonacci_row[-1] + fibonacci_row[-2]
end

p fibonacci_row
