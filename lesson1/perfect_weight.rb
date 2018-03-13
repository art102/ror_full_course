print 'Enter your name: '
user_name = gets.strip.capitalize

print 'Enter your height: '
user_height = gets.strip.to_i

perfect_weight = user_height - 110

if perfect_weight > 0
	puts "#{user_name}, your ideal weight is #{perfect_weight}."
else
	puts "#{user_name}, your weight already is normal!"
end
