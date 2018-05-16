class CargoTrain < Train
  def initialize(number)
    super(number, 'cargo')
  end

  def attach_wagon(wagon)
    if wagon.is_a?(CargoWagon)
      super
    end
  end
end
