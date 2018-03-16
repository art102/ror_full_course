=begin
Сумма покупок. Пользователь вводит поочередно название товара, 
цену за единицу и кол-во купленного товара (может быть нецелым числом). 
Пользователь может ввести произвольное кол-во товаров до тех пор, 
пока не введет "стоп" в качестве названия товара. 
На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, 
а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине". 
=end

cart = {} 

loop do
  print 'What would you like to buy? (enter "stop" if you finished): '
  item_name = gets.strip.downcase
  break if item_name == 'stop'

  print 'Enter price: '
  price = gets.strip.to_f

  print 'Enter amount: '
  amount = gets.strip.to_f

  cart[item_name] = { price => amount }
end

cost_of_cart = []
cart.each do |item, price|
  price.each do |val, amount|
    v = val * amount
    cost_of_cart << v
    puts "#{item} - #{v} dollars."
  end 
end
total_cost = cost_of_cart.inject(0) { |one, two| one + two }

puts "Cost of purchases in the cart: #{total_cost} dollars."