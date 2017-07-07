class Room
  attr_reader :guests, :songs, :entry_fee, :till
  def initialize(guests = [])
    @guests = guests
    @songs = []
    @limit = 4
    @entry_fee = 10
    @till = 0
  end

  def add_guest(guest_obj)
    condition = !too_many_guests? && take_entry_fee(guest_obj)
    @guests <<  guest_obj if condition
    return true if condition
  end

  def no_guests?()
    return true if @guests.count == 0 
  end

  def too_many_guests?
    return true if @guests.count > @limit
    return false
  end

  def remove_guest
    @guests.shift
  end

  def add_song(song_obj)
    @songs << song_obj
  end

  def check_song
    current_song = @songs[0]
    @songs.rotate!
    return current_song
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