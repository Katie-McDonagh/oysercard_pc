class OysterCard 

  MINBALANCE = 1
  MAXBALANCE = 90
  MINCHARGE = 1

  attr_reader :balance, :journeys

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(number)
    raise "Exceeds max top up limit" if balance + number > MAXBALANCE
    @balance += number
  end

  def touch_in(station)
    raise "minimum balance of #{OysterCard::MINBALANCE} required to touch in" if @balance < MINBALANCE
    @journeys[:entry_station] = (station)
  end

  def touch_out(station)
    deduct(MINBALANCE)
    @journeys[:exit_station] = (station)
  end

  def in_journey?
    !!@journeys[:entry_station] && @journeys[:exit_station] == nil
  end

  private 

  def deduct(number)
    @balance -= number
  end

end