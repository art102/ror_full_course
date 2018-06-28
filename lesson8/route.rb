require './instance_counter.rb'
require './validation_test_module.rb'
require './validation.rb'
require './accessors.rb'

class Route
  include InstanceCounter
  include ValidationTest
  include Accessors
  include Validation
  attr_reader :stations

  attr_accessor_with_history :variables
  strong_attr_accessor :variable, :type

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
    # add first and last stations to array stations
    @stations = [first_station, last_station]
    # called method from module
    # this method increases the value by one
    register_instance
  end

  # output all stations
  def show_stations
    @stations
  end

  # add station to route
  def add_station(station)
    @stations.insert(-2, station)
  end

  # remove station from route
  def remove_station(station)
    # remove station object if isn't last or first station
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
    else
      "You can't remove first or last station!"
    end
  end

  private

  def validate!
    raise 'This objects are same!' if @first_station == @last_station
  end
end
