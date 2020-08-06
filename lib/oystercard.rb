class OysterCard 

  MAXBALANCE = 90

  attr_reader :balance, :in_transit

  def initialize
    @balance = 0
    @in_transit = false
  end

  def top_up(number)
    raise "Exceeds max top up limit" if balance + number > MAXBALANCE
    @balance += number
  end

  def deduct(number)
    @balance -= number
  end
end