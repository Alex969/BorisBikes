require 'docking_station'
require 'bike'

describe Bike do
  it 'works' do
    bike = Bike.new
    expect(bike).to respond_to(:broken?)
  end

  it 'can be reported broken' do
    bike = Bike.new
    bike.report_broken
    expect(bike).to be_broken
  end 


end
