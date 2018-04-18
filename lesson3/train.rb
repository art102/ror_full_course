# require './route.rb'
# require './station.rb'

class Train
  attr_reader :wagons, :speed, :type, :current_station

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

  def message
    return 'Train is running!'
  end

  def attach_wagon
    #@speed == 0 ? @wagons += 1 : 'Train is running!'
    if @speed == 0
      @wagons += 1
    else
      message
    end
  end

  def detach_wagon
    # @speed == 0 && @wagons > 0 ? @wagons -= 1 : 'Train is running!'
    if @speed == 0 && @wagons > 0
      @wagons -= 1
    else
      message
    end
  end

  def accept_route(route)
    @route = route
    @route.stations[0].add_train(self)
    @current_station = 0
    #puts "Train is on the #{@route.stations[@current_station]} and train is moving on the route #{@route.stations.first.name} - #{@route.stations.last.name}"
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

  # go to the next station on the route
  def move_forward
    @current_station += 1 if @route.stations[@current_station] != @route.stations.last
    @route.stations[@current_station]
  end

  # go to the next station on the route
  def move_back
    @current_station -= 1 if @route.stations[@current_station] != @route.stations.first
    @route.stations[@current_station]
  end
end
