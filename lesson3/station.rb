class Station
  
  def initialize(name)
    @name = name
  end

  def accept_train(train_number)
    @trains_station = []
    @trains_station << train_number
  end

  def depart_train
    @@trains_station.pop
  end

  def current_trains
    @@trains_station { |number, type| puts "#{number} - {type}" }
  end

  def amount_trains
    cargo_amount = 0
    @trains_station.values.each { |train| cargo_amount += 1 if train == 'cargo' }
    passengers_amount = @trains.values.size - cargo_amount

    puts "cargo - #{cargo_amount}, passengers - #{passengers_amount}"
  end
end
