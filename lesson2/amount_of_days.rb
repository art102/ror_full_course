# Create empty array
date = []

print 'Enter day: '
day = gets.to_i
# If date more than 12
# print error
if day < 0 || day > 31
  puts 'Error! Wrong day!'
  exit
end

print 'Enter month: '
month = gets.to_i
if month > 12 || month < 0
  puts 'Error! Wrong month!'
  exit
end

print 'Enter year: '
year = gets.to_i
if year < 0 || year == 0
  puts 'Error! Wrong year!'
  exit
end

# Create array with amount of days 
# in the every moths of year
days_of_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# write to leap_year true if
# year is leap-year and false if not
leap_year ||= year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  
# If now is leap-year then
# change value of second element array
days_of_month[1] = 29 if leap_year

# If day and month are equal 1
# amount of day 1
if day == 1 && month == 1 || month == 1
  index_number = day
else
  months = month - 1
  # calculate amount of days
  index_number = day + days_of_month.first(months).inject(:+)
end
puts "#{index_number} day"
