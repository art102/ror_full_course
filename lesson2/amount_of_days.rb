# Create empty array
date = []

print 'Enter day: '
date << gets.to_i
# If date more than 12
# print error
if date[0] < 0 || date[0] > 31
  puts 'Error! Wrong day!'
  exit
end

print 'Enter month: '
date << gets.to_i
if date[1] > 12 || date[1] < 0
  puts 'Error! Wrong month!'
  exit
end

print 'Enter year: '
date << gets.to_i
if date[2] < 0 || date[2] == 0
  puts 'Error! Wrong year!'
  exit
end

# Create array with amount of days 
# in the every moths of year
days_of_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# write to leap_year true if
# year is leap-year and false if not
# leap_year = true if date[2] % 4 == 0 && date[2] % 400 == 0
if date[2] % 4 == 0 || date[2] % 400 == 0
  leap_year = true
else
  leap_year = false
end
# If now is leap-year then
# change value of second element array
days_of_month[1] = 29 if leap_year

# If day and month are equal 1
# amount of day 1
if date[0] == 1 && date[1] == 1
  index_number = 1
else
  months = date[1] - 1
  # calculate amount of days
  index_number = date[0] + days_of_month.first(months).inject(:+)
  puts "#{index_number} day"
end

