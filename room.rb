class Room
  attr_reader :guests, :songs
  def initialize(guests = [])
    @guests = guests
    @songs = {}
    @limit = 4
    @entry_fee = 10
  end

  def add_guest(guest)
    @guests <<  guest
  end

  def too_many_guests
    return true if @guests.count > @limit
    return false
  end

  def remove_guest
    @guests.shift
  end

  def add_song(song_obj)
    @songs[song_obj.name] = song_obj
  end
end