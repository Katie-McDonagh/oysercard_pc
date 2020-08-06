class OysterCard 

  MINBALANCE = 1
  MAXBALANCE = 90
  MINCHARGE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(number)
    raise "Exceeds max top up limit" if balance + number > MAXBALANCE
    @balance += number
  end

  def touch_in(station)
    raise "minimum balance of #{OysterCard::MINBALANCE} required to touch in" if @balance < MINBALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MINBALANCE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private 

  def deduct(number)
    @balance -= number
  end

end