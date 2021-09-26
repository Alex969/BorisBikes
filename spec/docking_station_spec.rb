require 'docking_station'

describe DockingStation do 
  
  describe "#release_bike" do
    it 'expects instances to respond to the release_bike method' do
      bike = Bike.new
      expect(DockingStation.new).to respond_to(:release_bike) 
    end

    it 'should return error if no bike' do
      expect { subject.release_bike }.to raise_error 'Empty dock'
    end

    it 'should return error if bike is broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'Reminding bike(s) are broken'
    end
  end

  it 'adds a bike and expects the bike to work' do
    bike = Bike.new
    expect(bike).to respond_to(:broken?)
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "should take a bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq([bike])
    end
  
    it { is_expected.to respond_to(:bikes) }

    it "should not accept a bike if theres already 20 bikes" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      bike = Bike.new
      expect {subject.dock(bike)}.to raise_error 'Full dock'
    end

    it "can give a bike when asking for a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end
      
  it "expects docking station to have a default capacity of 20" do
    expect(subject.capacity).to eq 20 
  end 

  it "expects to be able to set passed capacity" do
    dock_station = DockingStation.new(15)
    expect(dock_station.capacity).to eq 15
  end
end