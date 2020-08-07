require 'journey'

describe Journey do
let(:station){ double :station }

  it 'starts with an empty entry station' do
    expect(subject.entry_station).to be(nil)
  end

  it 'starts with an empty exit station' do
    expect(subject.exit_station).to be(nil)
  end

  it 'sets an entry station' do
    subject.set_entry_station(station)
    expect(subject.entry_station).to eq station
  end 
end