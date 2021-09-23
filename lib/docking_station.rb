class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize 
    @bikes = []
  end

  def dock(bike)
    raise RuntimeError if full? 
    @bikes << bike
  end

  def release_bike
    raise RuntimeError.new if empty?
    @bikes.pop 
  end

  private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end

