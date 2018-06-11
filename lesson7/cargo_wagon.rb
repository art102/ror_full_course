require './wagon.rb'

class CargoWagon < Wagon
  attr_reader :capacity, :occupied_capacity, :number

  def initialize(capacity)
    @capacity = capacity
    @occupied_capacity = 0
    @number = rand(1..1000)
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
