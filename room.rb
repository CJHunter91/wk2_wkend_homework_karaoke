class Room
  attr_reader :guests, :songs
  def initialize(guests)
    @guests = guests
    @songs = {}
  end

  def add_guest(guest)
    @guests <<  guest
  end

  def remove_guest
    @guests.shift
  end

  def add_song(song_obj)
    @songs[song_obj.name] = song_obj
  end
end