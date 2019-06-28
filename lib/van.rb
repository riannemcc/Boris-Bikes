
require_relative 'bike.rb'

class Van

  def initialize
    @van_bikes = []
  end

  def take_bike_dock(arg)
    dockedbikes = arg.bikes
    dockedbikes.each_with_index do |bike1, index|
      if bike1.broken == true
        @van_bikes << bike1
        dockedbikes.delete_at(index)
        return bike1
      end
    end
  end

  def put_bike_garage

  end

  def take_bike_garage

  end

  def put_bike_dock

  end

end
