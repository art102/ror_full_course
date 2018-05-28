require './instance_counter.rb'

class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(first_station, last_station)
    # add first and last stations to array stations
    @stations = [first_station, last_station]
    # called method from module
    # this method increases the value by one
    register_instance
  end

  # output all stations
  def show_stations
    @stations.each { |station| station }
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
end
