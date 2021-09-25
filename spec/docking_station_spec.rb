require 'docking_station'

DEFAULT_CAPACITY = 20

describe DockingStation do 
  
  describe "#release_bike" do
    it 'expects instances to respond to the release_bike method' do
      bike = Bike.new
      expect(DockingStation.new).to respond_to(:release_bike) 
    end

    it 'should return error if no bike' do
      dock_station = DockingStation.new
      expect { dock_station.release_bike }.to raise_error 'Empty dock'
    end

    it 'should return error if bike is broken' do
      dock_station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      dock_station.dock(bike)
      expect { dock_station.release_bike }.to raise_error 'Reminding bike(s) are broken'
    end
  end

  it 'adds a bike and expects the bike to work' do
    bike = Bike.new
    expect(bike).to respond_to(:broken?)
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "should take a bike" do
      dock_station = DockingStation.new
      bike = Bike.new
      expect(dock_station.dock(bike)).to eq([bike])
    end
  
    it { is_expected.to respond_to(:bikes) }

    it "should not accept a bike if theres already 20 bikes" do
      dock_station = DockingStation.new
      DEFAULT_CAPACITY.times {dock_station.dock(Bike.new)}
      bike = Bike.new
      expect {dock_station.dock(bike)}.to raise_error RuntimeError
    end

    it "can give a bike when asking for a bike" do
      docking_station = DockingStation.new
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end
  end

  
  #it {is_expected.to respond_to(:new).with(1).arguments } # DockingStation.new(235235)
      
  it "expects docking station to have a default capacity of 20" do
    dock_station = DockingStation.new
    expect(dock_station.capacity).to eq 20 
  end 

  it "expects to be able to set passed capacity" do
    dock_station = DockingStation.new(15)
    expect(dock_station.capacity).to eq 15
  end
end