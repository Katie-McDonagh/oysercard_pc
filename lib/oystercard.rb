class OysterCard 

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(number)
    raise "Exceeds max top up limit" if number > 90
    @balance += number
  end
end