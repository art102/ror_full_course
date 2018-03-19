=begin
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, 
а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине". 
=end

# create empty hash for items
cart = {} 

# Create loop where get info from user
loop do
  print 'What would you like to buy? (enter "stop" if you finished): '
  item_name = gets.strip.downcase
  break if item_name == 'stop'

  print 'Enter price: '
  price = gets.to_f

  print 'Enter amount: '
  amount = gets.to_f

  # add item name, price and amount to "cart" hash
  # cart[item_name] = { price => amount }
  cart[item_name] = { price: price, amount: amount }
end

total_cost = 0

cart.each do |item_name, item_info|
  one_product_cost = item_info[:price] * item_info[:amount]
  #calculate cost of all products in cart
  total_cost += one_product_cost
  puts "#{item_name} - #{one_product_cost}$"
end

puts "Cost of all products in cart - #{total_cost}$"
