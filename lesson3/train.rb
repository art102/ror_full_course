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
    @route.stations[0].add_train(self)
  end

  def moving_from_station(train)
    station.depart_train(train)
  end

  def arrival_to_station(train)
    station.add_train(train)
  end
end
