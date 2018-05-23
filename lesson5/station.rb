require './instance_counter.rb'

class Station
  include InstanceCounter
  attr_reader :name

  # create a new class variable
  # to store all exists stations in it
  @@stations = []

  # create class method for output object stations
  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    # add object of Station class to
    # class variable
    @@stations << self
    register_instance
  end

  # add train object to trains array
  def add_train(train)
    @trains << train
  end

  # return all trains on station
  def current_trains
    @trains
  end

  # get amount trains by type and return it
  def amount_trains(type_of_train)
    @trains.select { |train| train.type == type_of_train }
  end

  # remove train from station
  def depart_train(train)
    @trains.delete(train)
  end
end


