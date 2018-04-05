require './station.rb'
attr_reader :stations

class Route
  def initialize(first_station, last_station)
    #create empty array for stations
    @stations = []
    # add first and last stations to array stations
    @stations.push(first_station, last_station)
  end

  # output all stations
  def show_stations
    @stations.each { |station| puts station }
  end

  # add station to route
  def add_station(station)
    @stations.insert(-2, station)
  end

  # remove station from route
  def remove_station(station)
    @stations.delete(station)
  end
end
