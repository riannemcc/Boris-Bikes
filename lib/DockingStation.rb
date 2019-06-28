require_relative 'bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def set_capacity(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' unless !@bikes.empty?
    @bikes.each_with_index do |bike, index|
      @bikes.delete_at(index) unless bike.broken == true
    end
  end

  private def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  private def empty?
    @bikes.empty?
  end

  def dock(bike)
    fail "Docking Station full" unless !full?
    puts "Bike is broken" if bike.broken == true
    @bikes << bike
  end

end
