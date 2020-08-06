require 'oystercard'

describe OysterCard do

  it 'has a balance of 0 upon initialization' do
    expect(subject.balance).to eq(0)
  end

  it 'starts with the card being outside a journey' do
    expect(subject.in_transit).to be false 
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

  it 'allows a cards balance to be deducted from' do 
    subject.top_up(10)
    subject.deduct(10)
    expect(subject.balance).to eq(0)
  end

  describe '#in_transit' do
    before do
      subject.touch_in
    end

    it 'allows a card to be touched out after a journey' do
      subject.touch_out
      expect(subject.in_transit).to be false
    end

    it 'allows a card to be touched in' do
      expect(subject.in_transit).to be true
    end

  it 'can read a cards status to see if its in a journey' do
    expect(subject.in_journey?).to be true
  end

  it 'can read a cards status to see if it has finished a journey' do
    subject.touch_out
    expect(subject.in_journey?).to be false
  end


  end
end