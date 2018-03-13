# get the first sides from user
print 'Enter first side: '
a_side = gets.strip.to_i

# get the second sides from user
print 'Enter second side: '
b_side = gets.strip.to_i

# get the third sides from user
print 'Enter third side: '
c_side = gets.strip.to_i

#create empty array
sides = []

# add sides to array
sides << a_side
sides << b_side
sides << c_side

# sort size from minimal to max
# maximum number will be in last position
sides.sort!

if (sides[2] ** 2) == (sides[0] ** 2) + (sides[1] ** 2) && sides.uniq.size == 2
	puts "Triangle is right and is isosceles!"
elsif (sides[2] ** 2) == (sides[0] ** 2) + (sides[1] ** 2)
	puts 'Triangle is right'
end

