require './train.rb'

class Station 
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
  def amount_trains
    cargos = @trains.select { |train| train.type == 'cargo' }
    return "cargos - #{cargos.size}, passangers - #{@trains.size - cargos.size}"
  end

  # remove train from station
  def depart_train(train)
    @trains.delete(train)
  end
end


