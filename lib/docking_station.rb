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
    raise "Empty dock" if empty?
    bikes.each_with_index {|bike, index| bikes.delete_at(index); return bike if !bike.broken? }
    raise "Reminding bike(s) are broken" 
  end

  private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end

