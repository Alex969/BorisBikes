class DockingStation
  attr_reader :bikes 

  def initialize 
    @bikes = []
  end

  def dock(bike)
    raise RuntimeError if @bikes.length >= 20 
    @bikes << bike
  end

  def release_bike
    raise RuntimeError.new if @bikes.empty?
    @bikes.pop 
  end

end

