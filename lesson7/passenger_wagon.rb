require './wagon.rb'

class PassengerWagon < Wagon
  attr_reader :unfree_seats, :all_seats

  def initialize(seats)
    @all_seats = seats
    @unfree_seats = 0
  end

  def reduce_seats
    if @all_seats != 0 
      @all_seats -= 1
      @unfree_seats += 1
    else
      "Value can't be more than #{@all_seats}"
    end
  end
end
