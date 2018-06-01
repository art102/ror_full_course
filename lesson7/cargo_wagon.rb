require './wagon.rb'

class CargoWagon < Wagon
  attr_reader :capacity, :occupied_capacity

  def initialize(capacity)
    @capacity = capacity
    @occupied_capacity = 0
  end

  def occupy_capacity(capacity)
    if capacity <= @capacity
      @occupied_capacity += capacity
      @capacity -= capacity  
    else
      "Value can't be more than #{@capacity}"
    end
  end
end
