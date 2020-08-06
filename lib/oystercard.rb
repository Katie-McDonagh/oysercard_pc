class OysterCard 

  MAXBALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(number)
    raise "Exceeds max top up limit" if balance + number > MAXBALANCE
    @balance += number
  end

  def deduct(number)
    @balance -= number
  end
end