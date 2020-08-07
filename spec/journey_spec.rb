require 'journey'

describe Journey do
let(:station){ double :station }
let(:entry_station) { double :station }
let(:exit_station) { double :station }

describe "When checking if a journey is complete it" do
  it "knows if a journey is not complete" do
    subject.set_entry_station(station)
    expect(subject.complete?).to eq false
  end

  it "knows if a journey has not been touched out" do
    subject.set_exit_station(station)
    expect(subject.complete?).to eq false
  end

  it "completes a journey" do
    subject.set_entry_station(station)
    subject.set_exit_station(station)
    expect(subject.complete?).to eq true
  end
end

describe "contains info about entry and exit stations, it" do
  it 'starts with an empty entry station' do
    expect(subject.entry_station).to be(nil)
  end

  it 'starts with an empty exit station' do
    expect(subject.exit_station).to be(nil)
  end

  it 'sets an entry station' do
    subject.set_entry_station(entry_station)
    expect(subject.entry_station).to eq entry_station
  end 

  it 'sets an exit station' do
    subject.set_exit_station(exit_station)
    expect(subject.exit_station).to eq exit_station
  end
end

describe "calculates fares, it" do
  it 'returns a minimum fare for a complete journey' do
    subject.set_entry_station(station)
    subject.set_exit_station(station)
    expect(subject.calculate_fare).to eq Journey::MINCHARGE
  end

  it 'returns a penalty fare for an incomplete journey' do
    subject.set_entry_station(station)
    expect(subject.calculate_fare).to eq Journey::PENALTYFARE
  end
end

end