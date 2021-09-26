require 'docking_station'

describe DockingStation do 
let(:bike) { double :bike, :report_broken => true, broken?: false }
  describe "#release_bike" do
    it {is_expected.to respond_to :release_bike}

    it 'should return error if no bike' do
      expect { subject.release_bike }.to raise_error 'Empty dock'
    end

    it 'only releases a working bike' do
      allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).not_to be_broken
    end
  end

  it 'adds a bike and expects the bike to work' do
    allow(bike).to receive(:broken?)
    expect(bike).to respond_to(:broken?)
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "should take a bike" do
      expect(subject.dock(bike)).to eq([bike])
    end
  
    it { is_expected.to respond_to(:bikes) }

    it "raises an error if station is full" do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Full dock'
    end

    it "can give a bike when asking for a bike" do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it 'expects default capacity to be 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'expects to be able to set passed capacity' do
    number = 15
    station = DockingStation.new(number)
    expect(station.capacity).to eq number
  end
end