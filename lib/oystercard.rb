class OysterCard 

  MAXBALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(number)
    raise "Exceeds max top up limit" if number > MAXBALANCE
    @balance += number
  end
end