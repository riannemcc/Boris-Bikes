require 'DockingStation'

describe Bike do
  it { should respond_to(:working?)}

    it 'allows a bike to be reported if broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
end
