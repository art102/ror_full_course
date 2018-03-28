class Train
  attr_reader :wagons
  attr_accessor :speed

  @@trains = {}
  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = speed
    @@trains[number] = type
    route = Route.new
  end

  def start
    @speed = 20
  end

  def stop
    @speed = 0
  end

  def attach_wagon
    @speed == 0 ? @wagons += 1 : 'Train is running!'
  end

  def detach_wagon
    @speed == 0 && @wagons > 0 ? @wagons -= 1 : 'Train is running!'
  end

  def accept_route(route)
    @route = route
  end
end
