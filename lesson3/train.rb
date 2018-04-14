# require './route.rb'
# require './station.rb'

class Train
  attr_reader :wagons, :speed, :type

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
    #@route = Route.new(first_station, last_station)
  end

  def start
    @speed = 10
  end

  def speedup(amount)
    @speed += amount
  end

  def speed_down(amount)
    if @speed - amount < 0
      puts "Speed can't be less than zero!"
    else
      @speed -= amount
    end
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
    @current_station = 0
    puts "Train is on the #{@route.stations[@current_station]} and train is moving on the route #{@route.stations.first.name} - #{@route.stations.last.name}"
  end

  # show next station on the route
  def next_station
    @next_station = @route.stations[@current_station + 1] if @route.stations[@current_station] != @route.stations.last
  end

  # show previous station on the route
  def prev_station
    @prev_station = @route.stations[@current_station - 1] if @route.stations[@current_station] != @route.stations.first
    # puts @prev_station
    # #puts "Previous station is #{@route.stations[@prev_station].name}."
  end

  def move_forward
    @current_station += 1 if @route.stations[@current_station] != @route.stations.last
    @route.stations[@current_station]
  end

  def move_back
    @current_station -= 1 if @route.stations[@current_station] != @route.stations.first
    @route.stations[@current_station]
    # puts @prev_station
  end

  # def print_prev_station
  #   if prev_station.nil? == true
  #     puts 'Train is on the first station.'
  #   else
  #     puts "Previous station is #{prev_station}"
  #   end
  # end

  # def print_current_station
  #   puts "Текущая станция #{@current_station.name}"
  # end

  # def print_next_station
  #   if next_station.nil? == true
  #     puts 'Поезд находится на конечной станции'
  #   else
  #     puts "Следующая станция станция #{next_station}"
  #   end
  # end

  # def go_next_station
  #   @current_station = @next_station
  # end

  # def go_prev_station
  #   @current_station = @prev_station
  # end

  # def moving_from_station(train)
  #   station.depart_train(train)
  # end

  # def arrival_to_station(train)
  #   station.add_train(train)
  # end
end
