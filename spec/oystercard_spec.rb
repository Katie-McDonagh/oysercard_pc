require 'oystercard'

describe OysterCard do

  it 'has a balance of 0 upon initialization' do
    expect(subject.balance).to eq (0)
  end
end