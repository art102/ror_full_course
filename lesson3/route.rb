class Route	
  @@stations = []
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @@stations.push(first_station, last_station)
  end

  def stations
    @@stations.each { |station| puts station }
  end

  def add_station(name)
    @@stations.insert(-2, name)
  end

  def remove_station
    @@stations.delete_at(-2)
  end
end