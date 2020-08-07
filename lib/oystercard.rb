require_relative 'journey'
class OysterCard 

  MINBALANCE = 1
  MAXBALANCE = 90
  MINCHARGE = 1

  attr_reader :balance, :journeys, :current_journey

  def initialize(current_journey = Journey.new)
    @balance = 0
    @journeys = []
    @current_journey = current_journey
  end

  def top_up(number)
    raise "Exceeds max top up limit" if balance + number > MAXBALANCE
    @balance += number
  end

  def touch_in(station)
    raise "minimum balance of #{OysterCard::MINBALANCE} required to touch in" if @balance < MINBALANCE
    @current_journey.set_entry_station(station)
    # @journeys << {entry_station: @current_journey.entry_station}
    @journeys.push(@current_journey)
  end

  def touch_out(station)
    deduct(MINBALANCE)
    @journeys.last.set_exit_station(station)
    # @journeys.push(@current_journey)
    # @journeys.last.store(:exit_station, station)
  end

  def in_journey?
    @journeys.last.exit_station == nil
  end

  private 

  def deduct(number)
    @balance -= number
  end

end