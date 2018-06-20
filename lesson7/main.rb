require_relative "route"
require_relative "station"
require_relative "train"
require_relative "cargo_train"
require_relative "passenger_train"
require_relative "wagon"
require_relative "passenger_wagon"
require_relative "cargo_wagon"

# class for main program
# interface
class Main
  def initialize
    # create empty array for trains
    @stations = []
    # create empty array for routes
    @routes = []
    @exist_trains = []
    @cargo_trains = []
    @passenger_trains = []
    @passenger_wagons = []
    @cargo_wagons = []
  end

  def run
    print_menu
    main_menu
  end

  protected

  def show_stations
    if @stations.any?
      @stations.each_with_index do |station, index|
        puts "#{index + 1}. #{station.name}, trains - #{station.current_trains}"
      end
    else
      puts "You haven't created station yet"
    end
  end

  def show_route
    if @routes.any?
      @routes.each_with_index do |route, index|
        puts "#{index + 1}. #{route.stations.first.name} - #{route.stations.last.name}"
      end
    else
      puts "You don't have any route, please add route."
    end
  end

  def show_stations_route(route)
    puts "Route consist of next stations:"
    @routes[route - 1].stations.each_with_index do |station, index|
      puts "#{index + 1}. #{station.name}"
    end
  end

  def train_message
    puts "#{@exist_trains.last.type} train #{@exist_trains.last.number} number has been created."
  end

  def create_train(type, number)
    if type == 1
      @exist_trains << CargoTrain.new(number)
      train_message
    elsif type == 2
      @exist_trains << PassengerTrain.new(number)
      train_message
    end
  end

  def show_all_trains
    if @exist_trains.any?
      @exist_trains.each_with_index do |train, index|
        puts "#{index + 1}. #{train.number} - #{train.type}, wagons - #{train.wagons.size}"
      end
    else
      puts "You haven't created yet any trains!"
    end
  end

  def create_route
    if @stations.empty? || @stations.size == 1
      puts "You have to create two stations. Please type 1 and create two stations"
    else
      puts "Please choose a first station and last station for route:"
      show_stations
      print "first station: "
      first_station = gets.strip.to_i
      print "last station: "
      last_station = gets.strip.to_i
      @routes << Route.new(@stations[first_station - 1], @stations[last_station - 1])
      puts "You have #{@routes.size} route:"
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def choose_route_message
    puts "We have next routes:"
    show_route
    print "Please choose route: "
  end

  def add_station_to_route
    if @routes.any?
      choose_route_message
      route = gets.strip.to_i
      puts "We have next stations:"
      show_stations
      print "Please enter number of station for add to route" \
      " #{@routes[route - 1].stations.first.name} - #{@routes[route - 1].stations.last.name}: "
      station_for_add = gets.strip.to_i
      @routes[route - 1].add_station(@stations[station_for_add - 1])
    else
      puts "You don't have any route! Please type 3 and create route."
    end
  end

  def remove_station_from_route
    if @routes.any?
      choose_route_message
      route = gets.strip.to_i
      puts "We have next stations on the route:"
      show_stations_route(route)
      print "Please enter number of station for remove from route \
      #{@routes[route - 1].stations.first.name} - #{@routes[route - 1].stations.last.name}: "
      station_for_remove = gets.strip.to_i
      @routes[route - 1].remove_station(@routes[route - 1].stations[station_for_remove - 1])
    else
      puts "You don't have any route! Please type 3 and create route."
    end
  end

  def choose_train_message
    puts "We have this trains:"
    show_all_trains
    print "Please choose train: "
  end

  def train_index_get
    print "Please choose train: "
    @train = gets.strip.to_i
  end

  def route_ro_train(train, route)
    if train - 1 < @exist_trains.size && route - 1 < @routes.size
      @exist_trains[train - 1].accept_route(@routes[route - 1])
      puts "Train now is on the #{@exist_trains[train - 1].position.name} station"
    else
      puts "Maybe you have inputted incorrect train number or routing number."
    end
  end

  def routes_and_trains_exist?
    @routes.any? && @exist_trains.any?
  end

  def add_route_to_train
    if routes_and_trains_exist?
      choose_train_message
      train = gets.strip.to_i
      show_route
      print "Please choose route: "
      route = gets.strip.to_i
      route_ro_train(train, route)
    else
      puts "You don't have any route or trains! Please create them."
    end
  end

  def free_seats_exist?(seats, train)
    if seats.zero?
      puts "Capacity can't be empty!"
    else
      wagon = PassengerWagon.new(seats)
      @exist_trains[train - 1].attach_wagon(wagon)
    end
  end

  def train_belong_class?(train, type)
    train - 1 < @exist_trains.size && @exist_trains[train - 1].is_a?(type)
  end

  def choose_wagon(train)
    if train_belong_class?(train, PassengerTrain)
      print "Enter amount of seats: "
      passenger_seats = gets.strip.to_i
      free_seats_exist?(passenger_seats, train)
    elsif train_belong_class?(train, CargoTrain)
      print "Enter capacity of wagon: "
      cargo_capacity = gets.strip.to_i
      wagon = CargoWagon.new(cargo_capacity)
      @exist_trains[train - 1].attach_wagon(wagon)
    else
      puts "Incorrect number! Please input right number."
    end
  end

  def add_wagon
    if !@exist_trains.empty?
      show_all_trains
      train_index_get
      choose_wagon(@train)
    else
      puts "You haven't created train yet."
    end
  end

  def remove_wagon
    if !@exist_trains.empty?
      show_all_trains
      train_index_get
      @exist_trains[@train - 1].detach_wagon
    else
      puts "You haven't created train yet."
    end
  end

  def wagon_info(wagon)
    puts "Number: #{wagon.number}, type: #{wagon.class}," \
        "free seats: #{wagon.free_capacity}, unfree seats: #{wagon.occupied_capacity}"
  end

  def show_train_wagons
    if @exist_trains.any?
      choose_train_message
      train = gets.strip.to_i
      @exist_trains[train - 1].each_wagon do |wagon|
        if wagon.is_a?(PassengerWagon)
          wagon_info(wagon)
        elsif wagon.is_a?(CargoWagon)
          wagon_info(wagon)
        end
      end
    else
      puts "We don't have any train!"
    end
  end

  def train_forward(train)
    if @exist_trains[train - 1].respond_to?(:current_station)
      @exist_trains[train - 1].move_forward
      puts "Train has arrived to #{@exist_trains[train - 1].position.name}"
    else
      puts "Please add train to route."
    end
  end

  def move_train_forward
    if @exist_trains.any?
      show_all_trains
      train_index_get
      train_forward(@train)
    else
      puts "You haven't created train yet."
    end
  end

  def train_back(train)
    if @exist_trains[train - 1].position
      @exist_trains[train - 1].move_back
      puts "Train has arrived to #{@exist_trains[train - 1].position.name}"
    else
      puts "Please add train to route."
    end
  end

  def move_train_back
    if @exist_trains.any?
      show_all_trains
      train_index_get
      train_back(@train)
    else
      puts "You haven't created train yet."
    end
  end

  def check_station_input(station)
    if station <= @stations.size
      @stations[station - 1].each_train do |train|
        puts "Number: #{train.number}, type: #{train.class}, wagons: #{train.wagons.size}"
      end
    else
      puts "Invalid station number"
    end
  end

  def show_trains_on_station
    if trains_and_stations_exist?
      puts "We have this stations:"
      show_stations
      print "Please choose station: "
      station = gets.strip.to_i
      check_station_input(station)
    else
      puts "You haven't added station or train yet."
    end
  end

  def train_to_station(station, train)
    if station <= @stations.size && train <= @exist_trains.size
      @stations[station - 1].add_train(@exist_trains[train - 1])
    else
      puts "You haven't added train or station!"
    end
  end

  def trains_and_stations_exist?
    @stations.any? && @exist_trains.any?
  end

  def add_train_to_station
    if trains_and_stations_exist?
      puts "We have this stations:"
      show_stations
      print "Please choose station: "
      station = gets.strip.to_i
      choose_train_message
      train = gets.strip.to_i
      train_to_station(station, train)
    end
  end

  def train_exist_without_wagon?(train)
    @exist_trains[train - 1].is_a?(CargoTrain) && @exist_trains[train - 1].wagons.any?
  end

  def take_seat_wagon(train)
    if train_exist_without_wagon?(train)
      print "Please enter capacity: "
      wagon_capacity = gets.strip.to_i
      @exist_trains[train - 1].wagons[0].occupy_capacity(wagon_capacity)
      puts @exist_trains[train - 1].wagons[0].capacity
    elsif @exist_trains[train - 1].is_a?(PassengerTrain)
      @exist_trains[train - 1].wagons[0].occupy_capacity
      @exist_trains[train - 1].wagons[0].capacity
    else
      puts "Perhaps trains hasn't wagons or you don't have any trains"
    end
  end

  def take_seat
    if @exist_trains.any?
      choose_train_message
      train = gets.strip.to_i
      take_seat_wagon(train)
    else
      puts "You haven't added train yet."
    end
  end

  def create_station
    print "Enter station name: "
    name_station = gets.strip.downcase
    @stations << Station.new(name_station)
    puts "Station has been created!"
    puts @stations
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def get_train_info
    print "What type of train do you want?(1-cargo, 2-passenger): "
    train_type = gets.strip.to_i
    begin
      print "Please enter number for train: "
      train_number = gets.strip
      create_train(train_type, train_number)
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def choose_route
    if @routes.any?
      show_route
      print "Enter route number: "
      route_number = gets.strip.to_i
      show_stations_route(route_number)
    else
      puts "You have no routes."
    end
  end

  MENU = [
    '1 - Create station',
    '2 - Create train',
    '3 - Create route',
    '4 - Add station to the route',
    '5 - Remove station from the route',
    '6 - Assign route to train',
    '7 - Attach wagon to the train',
    '8 - Detach wagon from the train',
    '9 - Move train to forward',
    '10 - Move train to back',
    '11 - Show stations on the route',
    '12 - Show all stations with their trains',
    '13 - Show all trains',
    '14 - Show train wagons',
    '15 - Show trains on stations',
    '16 - Add train to station',
    '17 - To take seat(volume) in the wago'
  ].freeze

  def print_menu
    MENU.each { |string| puts string }
  end

  def main_menu
    loop do
      print 'Please enter number or press "0" if you want to exit: '
      users_input = gets.to_i

      break if users_input == 0

      case users_input
      when 1 then create_station
      when 2 then get_train_info
      when 3 then create_route
      when 4 then add_station_to_route
      when 5 then remove_station_from_route
      when 6 then add_route_to_trai
      when 7 then add_wagon
      when 8 then remove_wagon
      when 9 then move_train_forward
      when 10 then move_train_back
      when 11 then choose_route
      when 12 then show_stations
      when 13 then show_all_trains
      when 14 then show_train_wagons
      when 15 then show_trains_on_station
      when 16 then add_train_to_station
      when 17 then take_seat
      end
    end
  end
end

main = Main.new
main.run
