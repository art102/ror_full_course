# require './route.rb'
# require './station.rb'
require './producer_name.rb'

class Train
  include ProducerName
  attr_reader :speed, :type, :number, :wagons, :current_station

  @@trains = [] 

  def self.find(train_number)
    @@trains.select { |train| train.number == train_number }
  end

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    @@trains << self
  end

  def attach_wagon(wagon)
    if @speed == 0
      @wagons << wagon
      puts 'Wagon has been attached.'
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
      puts "Speed can't be less than zero!"
    else
      @speed -= amount
    end
  end

  # service method
  def message
    puts 'Train is running!'
  end

end
