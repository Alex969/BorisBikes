require 'docking_station'

describe DockingStation do 

  it 'expects instances to respond to the release_bike method' do
    bike = Bike.new
    expect(DockingStation.new).to respond_to(:release_bike) 
  end

  it 'adds a bike and expects the bike to work' do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end

  describe "#dock"
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "should take a bike and return it" do
      dock_station = DockingStation.new
      bike = Bike.new
      expect(dock_station.dock(bike)).to eq bike
    end
  
  it { is_expected.to respond_to(:bike) }

  it "can give a bike when asking for a bike" do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.release_bike).to eq bike
  end
 
  
end
