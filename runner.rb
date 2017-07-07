require_relative('./room.rb')
require_relative('./song.rb')
require_relative('./guest.rb')

class Runner
  
  def initialize()
    @room = Room.new()

  end

  def start()
    
    puts "You are running the Karaoke bar"
    help()
    while true
      puts "-----------------"
      
      input = gets.chomp
      case input.downcase
        when "add"; puts create_guest
        when "help"; help
        when "rem"; puts remove
        when "song"; puts create_song 
        when "next"; puts next_song
        when "q"; break
      end
    end
  end
      

  def create_guest()
    cant_afford = "That guest can't afford entry into this fancy establishment"
    too_many = "There are too many guests in the room. Remove one first"

    return too_many if @room.too_many_guests?
    puts "Enter guest name."
    input = gets.chomp

    guest = Guest.new(input)
    gained_entry = "#{guest.name} has joined the room."
    puts gained_entry if @room.add_guest(guest)
    puts cant_afford if !@room.take_entry_fee(guest)

  end

  def remove
    none = "There are no guests to remove"
    return none if @room.no_guests?
    guest_name = @room.guests[0].name
    @room.remove_guest
    puts "#{guest_name} has left the room."

  end

  def create_song
    puts "What is the name of the song?"
    name = gets.chomp
    puts "Who made the song?"
    artist = gets.chomp
    song = Song.new(name, artist)
    @room.add_song(song)
    puts "You added #{song.name} to the rooms playlist."
  end

  def next_song
    current_song = @room.check_song
    puts "This room is currently playing #{current_song.name} by #{current_song.artist}"
    #place puts here for any guests that like this song.
  end

  def help
    puts "You can do the following:"
    puts "---------"
    puts "Add a guest(add)"
    puts "Remove a guest(rem)"
    puts "Add a song(song)"
    puts "Plat next song in playlist(next)"
    puts "Quit the app(q)"
    puts "Get this message(help)"
  end

  
end

game = Runner.new
game.start