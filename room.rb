class Room
  attr_reader :guests, :songs, :entry_fee, :till
  def initialize(guests = [])
    @guests = guests
    @songs = {}
    @limit = 4
    @entry_fee = 10
    @till = 0
  end

  def add_guest(guest_obj)
    @guests <<  guest_obj if !too_many_guests? && take_entry_fee(guest_obj)
  end

  def too_many_guests?
    return true if @guests.count > @limit
    return false
  end

  def remove_guest
    @guests.shift
  end

  def add_song(song_obj)
    @songs[song_obj.name] = song_obj
  end

  def take_entry_fee(guest_obj)
    if (guest_obj.money >= @entry_fee)
      guest_obj.money -= @entry_fee
      @till += @entry_fee
      return true
    end
    return false
  end
end