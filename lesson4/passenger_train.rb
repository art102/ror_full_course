class PassengerTrain < Train
  def attach_wagon(wagon)
    if wagon.is_a?(PassengerWagon)
      super
    end
  end
end
