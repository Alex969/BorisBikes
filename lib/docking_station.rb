require './lib/bike.rb'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise RuntimeError if full? 
    @bikes << bike
  end

  def release_bike
    raise RuntimeError.new if empty?
    bikes.each {|bike| return bike if !bike.broken? }
    raise RuntimeError.new 
  end

  private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end

