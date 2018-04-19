#require './train.rb'

class Station
  attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
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
    trains_by_type = []
    @trains.select { |train| trains_by_type << train if train.type == type_of_train }
    trains_by_type
  end

  # remove train from station
  def depart_train(train)
    @trains.delete(train)
  end
end


