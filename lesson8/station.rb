require './instance_counter.rb'
require './validation_test_module.rb'
require './validation.rb'
require './accessors.rb'

class Station
  include InstanceCounter
  include ValidationTest
  include Accessors
  include Validation
  attr_reader :name

  attr_accessor_with_history :name
  strong_attr_accessor :variable, :type

  validate :name, :presence
  validate :name, :type, String

  # create a new class variable
  # to store all exists stations in it
  @@stations = []

  # create class method for output object stations
  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
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

  def each_train(&block)
    @trains.each(&block)
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

  private

  def validate!
    raise "The name can't be empty!" if @name.empty?
  end
end
