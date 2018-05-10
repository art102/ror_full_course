class CargoTrain < Train
  def attach_wagon(wagon)
    if wagon.is_a?(CargoWagon)
      @wagons << wagon
    end
  end
end
