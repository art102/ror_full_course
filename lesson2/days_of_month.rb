# Artur Daukaev
# 14.03.2018

# create a hash with amount days on month
days_of_month = {
  jan: 31, feb: 28, march: 31, april: 30, may: 31, june: 30,july: 31, 
  august: 31, september: 30, october: 31, november: 30, december: 31 
}

# use each
days_of_month.each do |month, days|
  # print months which consist thirty days 
  puts "#{month.capitalize}: #{days}" if days == 30
end