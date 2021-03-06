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

  def message
    'Train is running!'
  end

  def attach_wagon
    if @speed == 0
      @wagons += 1
    else
      message
    end
  end

  def detach_wagon
    if @speed == 0 && @wagons > 0
      @wagons -= 1
    else
      message
    end
  end

  def position
    @route.stations[@current_station]
  end

  def accept_route(route)
    @route = route
    @current_station = 0
    position.add_train(self)
  end

  # show next station on the route
  def next_station
    @route.stations[@current_station + 1] if @route.stations[@current_station] != @route.stations.last
  end

  # show previous station on the route
  def prev_station
    @route.stations[@current_station - 1] if @route.stations[@current_station] != @route.stations.first
  end

  # go to the next station on the route
  def move_forward
    position.depart_train(self)
    @current_station += 1 if @route.stations[@current_station] != @route.stations.last
    position.add_train(self)
  end

  # go to the next station on the route
  def move_back
    position.depart_train(self)
    @current_station -= 1 if @route.stations[@current_station] != @route.stations.first
    position.add_train(self)
  end
end
