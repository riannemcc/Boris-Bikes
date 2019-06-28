require 'DockingStation'
require 'bike'

describe DockingStation do
  it { should respond_to(:release_bike) }

  describe '#release_bike' do
    let(:bike) { double :bike }
    it 'releases a bike' do
      allow(bike).to receive(:broken).and_return(false)
      subject.dock(bike)
      subject.release_bike
      expect(subject.bikes).to eq []
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases working bikes' do
      bike = double(:bike, broken: false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'returns docked bike' do
      bike = double(:bike, broken: false)
      expect(subject.dock(bike)).to be bike
    end

    it 'raises an error when the docking station is full' do
      bike = double(:bike, broken: false)
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking Station full'
    end

    it { should respond_to(:set_capacity) }

    it 'allows user to set capacity when new docking station created' do
      expect(subject.set_capacity(15)).to eq 15
    end
  end

end
