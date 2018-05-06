require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

puts %q(
  1 - Create station 
  2 - Create train
  3 - Create route
  4 - Add station to the route
  5 - Remove station from the route
  6 - Assign route to train
  7 - Attach wagon to the train
  8 - Detach wagon from the train
  9 - Move train to forward
  10 - Move train to back
  11 - Show stations on the route
  12 - Show trains on the stations
)

# number for something
numb = 0

loop do
  print 'Please enter number or press "enter" if you want to exit: '
  users_input = gets.to_i

  break if users_input == ''

  numb += 1

  def create_wagon(type)
    if type == 'cargo'
      @cargo_wagons = []
      @cargo_wagons << CargoWagon.new
    elsif type == 'passenger'
      @passenger_wagons = []
      @passenger_wagons << PassengerWagon.new
    else
      puts "Incorrect wagon's type!"
    end
  end

  def create_train(type)
    if type == 'cargo'
      @cargo_trains = []
      @cargo_trains << CargoTrain.new
    elsif type == 'passenger'
      @passenger_trains = []
      @passenger_trains << PassengerTrain.new
    else
      puts 'Incorrect type!'
    end
  end



  if users_input == 1
    print 'Enter station name: '
    name_station = gets.chomp
    @stations = []
    @stations << Station.new(name_station)
    puts "Station has been created!"
  elsif users_input == 2
    print 'What type of train do you want?(1-cargo, 2-passenger): '
    train_type = gets.strip.downcase


      
  elsif users_input == 3
    print 'Enter first station: '
    first_station = gets.strip
    print 'Enter last station: '
    last_station = gets.strip
    route = Route.new   
  end



  # case users_input
  #   when 1 then station(numb) = Station.new
  #   when 2
  #   when 3
  #   when 4
  #   when 5
  #   when 6
  #   when 7
  #   when 8
  #   when 9
  #   when 10
  #   when 11
  #   when 12
  # end
end









# st1 = Station.new('UFA')
# puts 'Created new station UFA'

# st2 = Station.new('MSK')
# puts 'Created new station MSK'


# kazan = Station.new('KZN')
# puts 'Created new station KZN'

# route_ufa_msk = Route.new(st1, st2)
# route_ufa_msk.add_station(kazan)
# #route_ufa_msk.show_stations

# train = Train.new(77,'cargo',12)
# train.accept_route(route_ufa_msk)
# train.next_station
# train.prev_station
# train.print_prev_station
# train.print_current_station
# train.go_next_station
# #train.print_current_station
