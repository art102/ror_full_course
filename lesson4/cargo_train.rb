class CargoTrain < Train
  def attach_wagon(wagon)
    if wagon.is_a?(CargoWagon)
      super
    end
  end
end
