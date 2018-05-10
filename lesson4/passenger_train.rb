class PassengerTrain < Train
  def attach_wagon(wagon)
    if wagon.is_a?(PassengerWagon)
      @wagons << wagon
    end
  end
end
