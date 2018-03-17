# other way - (10..100).step(5).to_a
five_step_array = (10..100).to_a.find_all { |num| num % 5 == 0 }

five_step_array.each do |num|
	print "#{num} "
end
puts ""

