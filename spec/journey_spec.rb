require 'journey'

describe Journey do
let(:station){ double :station }
let(:entry_station) {double :station }
let(:exit_station) { double :station }

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