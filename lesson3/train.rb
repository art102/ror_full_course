class Train
  attr_reader :speed

  @@trains = {}
  def initialize(number, type)
    @number = number
    @type = type
    @@trains[number] = type
  end

  def start
    @speed = 20
  end

  def brake
    @speed = 0
  end
end
