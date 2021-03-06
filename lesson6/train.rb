
require './producer_name.rb'
require './instance_counter.rb'
require './validation_test_module.rb'


class Train
  include ProducerName
  include InstanceCounter
  include ValidationTest
  attr_reader :speed, :type, :number, :wagons, :current_station

  @@trains = {} 
  NUMBER_FORMAT = /^\d{3}\-?[a-z]{2}$/i

  def self.find(train_number)
    @@trains[train_number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @speed = 0
    @wagons = []
    @@trains[@number] = self
    # called method from module
    # this method increases the value by one
    register_instance
  end

  def attach_wagon(wagon)
    if @speed == 0
      @wagons << wagon
    else
      message
    end
  end

  def detach_wagon
    if @speed == 0 && @wagons.size > 0
      @wagons.pop
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

  protected

  # because dispatcher can't start the train
  def start
    @speed = 10
  end

  # because dispatcher can't change speed the train
  def speedup(amount)
    @speed += amount
  end

  def speed_down(amount)
    if @speed - amount < 0
      "Speed can't be less than zero!"
    else
      @speed -= amount
    end
  end

  # service method
  def message
    'Train is running!'
  end

  def validate!
    raise "The number can't be empty!" if @number.nil?
    raise "Number is can't be at least than 3 symbols!" if @number.size < 3
    raise "Number has invalid format" if @number !~ NUMBER_FORMAT
    raise "The type can't be empty!" if @type.empty?
  end

end
