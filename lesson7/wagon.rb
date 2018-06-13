require './producer_name.rb'

class Wagon
  include ProducerName
  attr_reader :capacity, :occupied_capacity, :number, :free_capacity

  def initialize(capacity)
    @capacity = capacity
    @occupied_capacity = 0
    @free_capacity = capacity
    @number = rand(1..1000)
  end

  def occupy_capacity(capacity)
    if capacity <= @free_capacity
      @occupied_capacity += capacity
      @free_capacity -= capacity  
    else
      puts "Capacity has already ended"
    end
  end
end
