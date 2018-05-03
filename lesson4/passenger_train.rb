class PassengerTrain < Train
  def attach_wagon(wagon)
    if @speed == 0 && wagon.is_a?(PassengerWagon)
      @wagons << wagon
    else
      "This wagon isn't #{self.class} or train is running."
    end
  end
end
