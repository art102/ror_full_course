#create empty array
sides = []

# get the first sides from user
print 'Enter first side: '
sides << gets.strip.to_i

# get the second sides from user
print 'Enter second side: '
sides << gets.strip.to_i

# get the third sides from user
print 'Enter third side: '
sides << gets.strip.to_i

# sort size from minimal to max
# maximum number will be in last position
sides.sort!

# calculcate triangle rectangular 
# and write value into the rectangular_triangle variable
rectangular_triangle = sides[2]**2 == sides[0]**2 + sides[1]**2

if rectangular_triangle && sides.uniq.size == 2
	puts "Triangle is rectangular and is isosceles!"
elsif rectangular_triangle
	puts 'Triangle is rectangular.'
elsif sides.uniq.size == 1
	puts 'Triangle is isosceles and equilateral, but not rectangular.'
else
	puts 'Triangle unknown.'
end

