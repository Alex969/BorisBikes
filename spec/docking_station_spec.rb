require 'docking_station'

describe DockingStation do 
let(:bike) { double :bike, :report_broken => true, broken?: false }
subject(:ds) { DockingStation.new }
  describe ".release_bike" do

    context 'when using asking the station for a bike' do 
      it {is_expected.to respond_to :release_bike}
    end 

    it 'should return error if no bike' do
      expect { ds.release_bike }.to raise_error 'Empty dock'
    end

    it 'only releases a working bike' do
      allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      ds.dock(bike)
      expect(ds.release_bike).not_to be_broken
    end
  end

  it 'adds a bike and expects the bike to work' do
    allow(bike).to receive(:broken?)
    expect(bike).to respond_to(:broken?)
  end

  describe ".dock" do
    
    context 'when I try to dock a bike at a station 'do
      it { is_expected.to respond_to(:dock).with(1).argument }
    end  

    it "should take a bike" do
      expect(ds.dock(bike)).to eq([bike])
    end

    it "raises an error if station is full" do
      ds.capacity.times { ds.dock(bike) }
      expect { ds.dock(bike) }.to raise_error 'Full dock'
    end

    it "can give a bike when asking for a bike" do
      ds.dock(bike)
      expect(ds.release_bike).to eq bike
    end
  end

  it 'expects default capacity to be 20' do
    expect(ds.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'expects to be able to set passed capacity' do
    number = 15
    station = DockingStation.new(number)
    expect(station.capacity).to eq number
  end
end