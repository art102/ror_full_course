# Create empty array
date = []

print 'Enter day: '
date << gets.strip.to_i

print 'Enter month: '
date << gets.strip.to_i

print 'Enter year: '
date << gets.strip.to_i

# Create array with amount of days 
# in the every moths of year
days_of_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# write to leap_year true if
# year is leap-year and false if not
leap_year = date[2] % 4 == 0 ? true : false
# If now is leap-year then
# change value of second element array
days_of_month[1] = 29 if leap_year

# If day and month are equal 1
# amount of day 1
if date[0] == 1 && date[1] == 1
  index_number = 1
# If date more than 12
# print error
elsif date[1] > 12
  puts 'Error! Can not be more than 12 months.'
  exit
else
  months = date[1] - 1
  # calculate amount of days
  index_number = date[0] + days_of_month[0...months].inject(0) { |one, two| one + two }
end

puts "#{index_number} day(s)"



