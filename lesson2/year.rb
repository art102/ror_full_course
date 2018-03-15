date = []

print 'Enter day: '
date << gets.strip.to_i

print 'Enter month: '
date << gets.strip.to_i

print 'Enter month: '
date << gets.strip.to_i

days_of_month = {
  1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 
  8 => 31, 9 => 30, 10 => 31,  11 => 30, 12 => 31 
}

leap_year = date[2] % 4 == 0 ? true : false

days_of_month[2] = 29 if leap_year

p days_of_month

days_of_month.each do |mon, day|
  
  if leap_year

  end
end

