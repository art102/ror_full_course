# require './route.rb'
# require './station.rb'

class Train
  attr_reader :wagons, :speed, :type

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
    @route = Route.new(first_station, last_station)
  end

  def start
    @speed = 10
  end

  def speedup(amount)
    @speed += amount
  end

  def speed_down(amount)
    @speed -= amount if @speed > 0
  end

  def attach_wagon
    @speed == 0 ? @wagons += 1 : 'Train is running!'
  end

  def detach_wagon
    @speed == 0 && @wagons > 0 ? @wagons -= 1 : 'Train is running!'
  end

  def accept_route(route)
    #@route.stations[0].add_train(self)
    @route = route
    @current_station = route.first
    puts "Train is on the #{@current_station} and train is moving on the route #{@route.first} - #{@route.last}"
  end

  def next_station
    @next_station = @route[@route.index(@current_station) + 1] if @current_station != @route.last
  end

  def prev_station
    @prev_station = @route[@route.index(@current_station) - 1] if @current_station != @route.first
  end

  def print_prev_station
    if prev_station.nil? == true
      puts 'Поезд находится на начальной станции'
    else
      puts "Предыдущая станция #{prev_station}"
    end
  end

  def print_current_station
    puts "Текущая станция #{@current_station}"
  end

  def print_next_station
    if next_station.nil? == true
      puts 'Поезд находится на конечной станции'
    else
      puts "Следующая станция станция #{next_station}"
    end
  end

  def go_next_station
    @current_station = @next_station
  end

  def go_prev_station
    @current_station = @prev_station
  end

  # def moving_from_station(train)
  #   station.depart_train(train)
  # end

  # def arrival_to_station(train)
  #   station.add_train(train)
  # end
end
