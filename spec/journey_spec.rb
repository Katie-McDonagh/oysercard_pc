require 'journey'

describe Journey do
let(:station){ double :station }

  it 'sets an entry station' do
    subject.set_entry_station(station)
    expect(subject.entry_station).to eq station
  end 
end