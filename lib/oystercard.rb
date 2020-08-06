class OysterCard 

  MINBALANCE = 1
  MAXBALANCE = 90
  MINCHARGE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
  end

  def top_up(number)
    raise "Exceeds max top up limit" if balance + number > MAXBALANCE
    @balance += number
  end

  def touch_in(station)
    raise "minimum balance of #{OysterCard::MINBALANCE} required to touch in" if @balance < MINBALANCE
    @entry_station = station
    @journeys[:entry_station] = (@entry_station)
  end

  def touch_out(station)
    deduct(MINBALANCE)
    @entry_station = nil
    @exit_station = station
    @journeys[:exit_station] = (@exit_station)
  end

  def in_journey?
    !!entry_station
  end

  private 

  def deduct(number)
    @balance -= number
  end

end