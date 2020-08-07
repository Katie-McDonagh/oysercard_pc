require 'oystercard'

describe OysterCard do
  let(:station){ double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey){ [entry_station: station, exit_station: station] }


  describe 'storing the stations' do
    before do
      subject.top_up(10)
      subject.touch_in(entry_station)
    end

  it 'stores the entry station' do
    expect(subject.journeys).to include {entry_station station}
  end

  it 'stores the exit station' do
    subject.touch_out(station)
    expect(subject.journeys).to include {exit_station station}
  end

  it 'stores a complete journey' do
    # subject {described_class.new(name: "Old Street", zone: 1)}
    # subject.touch_out(exit_station)
    # expect(subject.journeys).to include journey
    subject.touch_in("Bank")
    subject.touch_out("Victoria")
    expect(subject.journeys.last.entry_station).to eq "Bank"
    expect(subject.journeys.last.exit_station).to eq "Victoria"
  end
end

  it 'has a balance of 0 upon initialization' do
    expect(subject.balance).to eq(0)
  end

  it 'starts with the card being outside a journey' do
    expect(subject.journeys).to be {}
  end

  describe '#top_up' do

    it 'has the ability to top up a card' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end

    it 'only allows a top up for max balance of 90' do
      subject.top_up(OysterCard::MAXBALANCE)
      expect{subject.top_up(1)}.to raise_error("Exceeds max top up limit")
    end
  end

  describe '#in_transit' do
    before do
      subject.top_up(10)
      subject.touch_in(station)
    end

    it 'allows a card to be touched out after a journey' do
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to be false
    end

    it 'allows a card to be touched in' do
      expect(subject.journeys).to include {entry_station station}
    end

    it 'can read a cards status to see if its in a journey' do
      expect(subject.in_journey?).to be true
    end

    it 'can read a cards status to see if it has finished a journey' do
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to be false
    end
  end

  it 'has a minimum balance requirment' do
    expect{ subject.touch_in(entry_station) }.to raise_error("minimum balance of #{OysterCard::MINBALANCE} required to touch in")
  end

  it 'deducts the correct fare from the card upon touch out' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by (-OysterCard::MINCHARGE)
  end
end
