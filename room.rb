class Room
  attr_reader :guests
  def initialize(guests)
    @guests = guests
  end

  def add_guest(guest)
    @guests <<  guest
  end
end