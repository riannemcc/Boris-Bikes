require 'DockingStation'

describe DockingStation do
  it { should respond_to(:release_bike) }

  describe '#release_bike' do
    it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end

      it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
      end

    end

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq bike
  end

  it 'raises an error when the docking station is full' do
    bike = Bike.new
    20.times { subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error 'Docking Station full'
  end

end
