require 'oystercard'

describe OysterCard do

  it 'has a balance of 0 upon initialization' do
    expect(subject.balance).to eq (0)
  end

  it 'has the ability to top up a card' do
    subject.top_up(5)
    expect(subject.balance).to eq (5)
  end
end