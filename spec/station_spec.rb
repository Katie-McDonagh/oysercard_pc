require 'station'

describe Station do
  it 'has a name on creation' do
    station = Station.new("Bank")
    expect(station.name).to eq "Bank"
  end

  # it 'has a zone on creation' do
  #   station = Station.new("Bank", 1)
  #   expect(station.zone).to eq 1
  # end
end