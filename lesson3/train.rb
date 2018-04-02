require './route.rb'
require './station.rb'

class Train
  attr_reader :wagons, :speed, :type

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
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

  def add_route(route)
    
  end
end
