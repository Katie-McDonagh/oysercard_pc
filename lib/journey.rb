class Journey

  attr_reader :entry_station, :exit_station, :current_journey

  def intialize
    @entry_station 
    @exit_station
  end

  def set_entry_station(name)
    @entry_station = name
  end

  def set_exit_station(name)
    @exit_station = name
  end

  def complete?
   !!@exit_station == nil
  end

end