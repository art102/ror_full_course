class PassengerTrain < Train
  def initialize(number)
    super(number, 'passenger')
  end
  
  def attach_wagon(wagon)
    if wagon.is_a?(PassengerWagon)
      super
    end
  end
end
