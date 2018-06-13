require './wagon.rb'

class PassengerWagon < Wagon
  def occupy_capacity
    super(1)
  end
end
