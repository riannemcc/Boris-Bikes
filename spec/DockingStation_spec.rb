require 'DockingStation'
require 'bike'

describe DockingStation do
  it { should respond_to(:release_bike) }

  describe '#release_bike' do
    it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        subject.release_bike
        expect(subject.bikes).to eq []
      end

      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

      it 'prevents broken bike from being released' do
        subject = DockingStation.new
        broken_bike = Bike.new
        broken_bike.report_broken
        subject.dock(broken_bike)
        subject.release_bike
        expect(subject.bikes).to eq [broken_bike]
      end

    end

      it 'returns docked bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bikes).to eq [bike]
      end

      it 'raises an error when the docking station is full' do
        bike = Bike.new
        DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
        expect { subject.dock(bike) }.to raise_error 'Docking Station full'
      end

      it { should respond_to(:set_capacity) }

        it 'allows user to set capacity when new docking station created' do
          expect(subject.set_capacity(15)).to eq 15
        end

end
