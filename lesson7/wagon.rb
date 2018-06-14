require './producer_name.rb'

class Wagon
  include ProducerName
  attr_reader :capacity, :occupied_capacity, :number

  def initialize(capacity)
    @capacity = capacity
    @occupied_capacity = 0
    @number = rand(1..1000)
  end

  def occupy_capacity(capacity)
    if capacity <= @capacity && @occupied_capacity != @capacity 
      @occupied_capacity += capacity
      # @free_capacity -= capacity  
    else
      puts "Capacity has already ended"
    end
  end

  def free_capacity
    @capacity - @occupied_capacity
  end
end
