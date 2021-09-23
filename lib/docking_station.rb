class DockingStation
  attr_reader :bike

  def dock(bike)
    @bike = bike
  end

  def release_bike
    raise RuntimeError.new if @bike == nil 
    Bike.new
  end

end

