require './wagon.rb'

class PassengerWagon < Wagon
  def initialize(capacity)
    super
  end

  def occupy_capacity
    if @capacity != 0 
      @capacity -= 1
      @occupied_capacity += 1
    else
      puts "Capacity has already over"
    end
  end
end
