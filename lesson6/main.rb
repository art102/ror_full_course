require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

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
    if @stations.size > 0
      @stations.each_with_index do |station, index|
        puts "#{index + 1}. #{station.name}, trains - #{station.current_trains}"
      end
    else
      puts "You haven't created station yet"
    end
  end

  def show_route
    if @routes.size > 0
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

  def train_message
    puts "#{@exist_trains.last.type} train with #{@exist_trains.last.number} number has been created."
  end

  def create_train(type,number)
    if type == 1
      @exist_trains << CargoTrain.new(number)
      train_message
    elsif type == 2
      @exist_trains << PassengerTrain.new(number)
      train_message
    else
      puts 'Incorrect type!'
    end
  end

  def show_all_trains
    if @exist_trains.size > 0 
      @exist_trains.each_with_index do |train, index|
        puts "#{index + 1}. #{train.number} - #{train.type}, speed - #{train.speed} wagons - #{train.wagons}"
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
      print 'first station: '
      first_station = gets.strip.to_i
      print 'last station: '
      last_station = gets.strip.to_i
      @routes << Route.new(@stations[first_station - 1], @stations[last_station - 1])
      puts "You have #{@routes.size} route:"
      p @routes
    end
  end

  def add_station_to_route
    if @routes.size != 0
      puts "We have next routes:"
      show_route
      print "Please choose route: "
      route = gets.strip.to_i
      puts "We have next stations:"
      show_stations
      print "Please enter number of station for add to route #{@routes[route - 1].stations.first.name} - #{@routes[route - 1].stations.last.name}: "
      station_for_add = gets.strip.to_i
      @routes[route - 1].add_station(@stations[station_for_add - 1])
    else
      puts "You don't have any route! Please type 3 and create route."
    end
  end

  def remove_station_from_route
    if @routes.size != 0
      puts "We have next routes:"
      show_route
      print "Please choose route: "
      route = gets.strip.to_i
      puts "We have next stations on the route:"
      show_stations_route(route)
      print "Please enter number of station for remove from route #{@routes[route - 1].stations.first.name} - #{@routes[route - 1].stations.last.name}: "
      station_for_remove = gets.strip.to_i
      # puts @stations[station_for_remove].name
      @routes[route - 1].remove_station(@routes[route - 1].stations[station_for_remove - 1])
    else
      puts "You don't have any route! Please type 3 and create route."
    end
  end

  def add_route_to_train
    if @routes.size != 0 && @exist_trains.size > 0
      puts "We have this trains:"
      show_all_trains
      print "Please choose train: "
      train = gets.strip.to_i
      puts "We have this routes:"
      show_route
      print "Please choose route: "
      route = gets.strip.to_i
      if train-1 < @exist_trains.size && route-1 < @routes.size
        @exist_trains[train - 1].accept_route(@routes[route-1])
        puts "Train now is on the #{@exist_trains[train - 1].position.name} station"
        puts "Train added to route" 
      else
        puts 'Maybe you have inputted incorrect train number or routing number.'
      end
    else
      puts "You don't have any route or trains! Please create them."
    end
  end

  def choose_wagon(train)
    if train-1 < @exist_trains.size && @exist_trains[train - 1].is_a?(PassengerTrain)
      wagon = PassengerWagon.new
      @exist_trains[train - 1].attach_wagon(wagon)
    elsif train-1 < @exist_trains.size && @exist_trains[train - 1].is_a?(CargoTrain)
      wagon = CargoWagon.new
      @exist_trains[train - 1].attach_wagon(wagon)
    else
      puts "Incorrect number! Please input right number."
    end
  end

  def add_wagon
    if @exist_trains.size > 0
      show_all_trains
      print "Please choose train: "
      train = gets.strip.to_i
      choose_wagon(train)
    else
      puts "You haven't created train yet."
    end
  end

  def remove_wagon
    if @exist_trains.size > 0
      show_all_trains
      print "Please choose train: "
      train = gets.strip.to_i
      @exist_trains[train - 1].detach_wagon
    else
      puts "You haven't created train yet."
    end
  end

  def move_train_forward
    if @exist_trains.size > 0
      show_all_trains
      print "Please choose train: "
      train = gets.strip.to_i
      if @exist_trains[train - 1].respond_to?(:current_station)
        @exist_trains[train - 1].move_forward
        puts "Train has arrived to #{@exist_trains[train - 1].position.name}"
      else
        puts "Please add train to route."
      end
    else
      puts "You haven't created train yet."
    end
  end

  def move_train_back
    if @exist_trains.size > 0
      show_all_trains
      print "Please choose train: "
      train = gets.strip.to_i
      if @exist_trains[train - 1].position
        @exist_trains[train - 1].move_back
        puts "Train has arrived to #{@exist_trains[train - 1].position.name}"
      else
        puts "Please add train to route."
      end
    else
      puts "You haven't created train yet."
    end
  end

  def print_menu
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
      12 - Show all stations with their trains
      13 - Show all trains
    )
  end

  def main_menu
    loop do
      print 'Please enter number or press "0" if you want to exit: '
      users_input = gets.to_i

      break if users_input == 0

      if users_input == 1
        print 'Enter station name: '
        name_station = gets.strip.downcase
        @stations << Station.new(name_station)
        puts "Station has been created!"
        puts @stations
      elsif users_input == 2
        print 'What type of train do you want?(1-cargo, 2-passenger): '
        train_type = gets.strip.to_i
        print "Please enter number for train: "
        train_number = gets.strip
        create_train(train_type, train_number)
      elsif users_input == 3
        create_route
      elsif users_input == 4
        add_station_to_route
      elsif users_input == 5
        remove_station_from_route
      elsif users_input == 6
        add_route_to_train
      elsif users_input == 7
        add_wagon
      elsif users_input == 8
        remove_wagon
      elsif users_input == 9
        move_train_forward
      elsif users_input == 10
        move_train_back
      elsif users_input == 11
        if @routes.size > 0
          show_route
          print "Enter route number: "
          route_number = gets.strip.to_i
          show_stations_route(route_number)
        else
          puts 'You have no routes.'
        end
      elsif users_input == 12
        show_stations
      elsif users_input == 13
        show_all_trains
      end
    end
  end
end

main = Main.new
main.run
