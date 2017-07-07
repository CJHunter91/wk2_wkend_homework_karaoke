class Room
  attr_reader :guests
  def initialize(guests)
    @guests = guests
  end

  def add_guest(guest)
    @guests <<  guest
  end

  def remove_guest
    @guests.shift
  end
end