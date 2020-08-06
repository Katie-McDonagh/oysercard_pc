class OysterCard 

  MINBALANCE = 1
  MAXBALANCE = 90
  MINCHARGE = 1

  attr_reader :balance, :in_transit

  def initialize
    @balance = 0
    @in_transit = false
  end

  def top_up(number)
    raise "Exceeds max top up limit" if balance + number > MAXBALANCE
    @balance += number
  end

  def touch_in
    raise "minimum balance of #{OysterCard::MINBALANCE} required to touch in" if @balance < MINBALANCE
    @in_transit = true
  end

  def touch_out
    deduct(MINBALANCE)
    @in_transit = false
  end

  def in_journey?
    @in_transit
  end

  private 

  def deduct(number)
    @balance -= number
  end

end