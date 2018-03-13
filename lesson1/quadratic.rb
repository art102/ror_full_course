require 'mathn'

# get the first coefficient
print 'Enter coefficient "a": '
coefficient_a = gets.strip.to_f

# get the second coefficient
print 'Enter coefficient "b": '
coefficient_b = gets.strip.to_f

# get the third coefficient
print 'Enter coefficient "c": '
coefficient_c = gets.strip.to_f

# calculate discriminant
discriminant = (coefficient_b ** 2) - (4 * coefficient_a * coefficient_c)

# calculate square root of discriminant
sqr_discriminant = Math.sqrt(discriminant)

# if calculated discriminant more zero
if discriminant > 0
	# calculate second squire root and write value to sqr_1
	sqr_1 = (-coefficient_b + sqr_discriminant) / (2 * coefficient_a)
	# calculate second squire root and write value to sqr_2
	sqr_2 = (-coefficient_b - sqr_discriminant) / (2 * coefficient_a)
	# print discriminant and two rounded roots
	puts "The discriminant is #{discriminant}"
	puts "The square_1 is #{sqr_1.round(3)}"
	puts "The square_2 is #{sqr_2.round(3)}"
# if the discriminant is zero
# print discriminant and one rounded root
elsif discriminant == 0
	sqr = -coefficient_b / (2 * -coefficient_a)
	puts "The discriminant is #{discriminant}"
	puts "The square is #{sqr.round(3)}"
# if the discriminant less than zero
# print discriminant value and say 'No roots!'
elsif discriminant < 0
	puts "The discriminant is #{discriminant}"
	puts 'No roots!'
end
