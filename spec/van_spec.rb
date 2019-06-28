require 'DockingStation'
require 'bike'
require 'van'

describe Van do

  describe '#take_bike_dock' do
    it 'takes broken bikes from docking station' do
      bike = Bike.new
      bike.report_broken
      dockstat = DockingStation.new
      dockstat.dock(bike)
      van = Van.new
      expect(van.take_bike_dock(dockstat)).to eq bike
    end
  end

  describe '#put_bike_garage' do
    it 'takes broken bikes from docking station' do

    end
  end

  describe '#take_bike_garage' do
    it 'takes working bikes from garages' do

    end
  end

  describe '#put_bike_dock' do
    it 'takes working bikes from garages' do

    end
  end

end
