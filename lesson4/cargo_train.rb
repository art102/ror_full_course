class CargoTrain < Train
  def attach_wagon(wagon)
    if @speed == 0 && wagon.is_a?(CargoWagon)
      @wagons << wagon
    else
      "This wagon isn't CargoWagon or train is running."
    end
  end
end
