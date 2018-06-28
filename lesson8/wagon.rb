require './producer_name.rb'

class Wagon
  include ProducerName
  include Accessors
  include Validation

  attr_reader :capacity, :occupied_capacity, :number
  attr_accessor_with_history :variables

  validate :number, :presence

  def initialize(capacity)
    @capacity = capacity
    @occupied_capacity = 0
    @number = rand(1..1000)
  end

  def occupy_capacity(capacity)
    if free_capacity >= capacity
      @occupied_capacity += capacity
    else
      "Capacity has already ended"
    end
  end

  def free_capacity
    @capacity - @occupied_capacity
  end
end
