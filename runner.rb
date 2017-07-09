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
        when "add"; puts add_guest
        when "help"; help
        when "rem"; puts remove
        when "song"; puts create_song 
        when "next"; puts next_song
        when "d"; puts buy_drink
        when "q"; break
      end
    end
  end
      

  def add_guest()
    
    cant_afford = "That guest can't afford entry into this fancy establishment"
    too_many = "There are too many guests in the room. Remove one first"
    return too_many if @room.too_many_guests?

    #get name and favourite song then pass to create guest
    puts "Enter guest name."
    name = gets.chomp
    puts "Enter their favourite song."
    favourite = gets.chomp
    guest = create_guest(name, favourite)

    #check if the guest can afford, if false then not added
    return cant_afford if !@room.take_entry_fee(guest)


    puts "#{guest.name} has joined the room." if @room.add_guest(guest)
    puts "-----------"
    puts "Would you like to create a tab for #{guest.name}(y/n)"
    tab = gets.chomp 
    create_tab(guest) if tab == ("y")
  end

  def create_guest(name, favourite)
    return favourite != '' ? guest = Guest.new(name, favourite) : guest = Guest.new(name)
  end

  def create_tab(guest)
    @room.bar_tab.make_tab(guest)
    puts "Tab Created"
    puts @room.bar_tab.guest_tabs
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
    if !current_song.nil?
      puts "This room is currently playing #{current_song.name} by #{current_song.artist}"
      #place puts here for any guests that like this song.
      guests = @room.guests.select{|guest| guest.favourite == current_song.name}
      return if guests.count == 0
      puts "Guests #{guests.map!{|guest| guest.name}.join(',')} scream with excitement at their favourite song!"
      puts "Everyone loves Journey" if current_song.name == "Dont stop believing"
    end
  end

  def help
    puts "You can do the following:"
    puts "---------"
    puts "Add a guest(add)"
    puts "Remove a guest(rem)"
    puts "Add a song(song)"
    puts "Play next song in playlist(next)"
    puts "Buy a drink(d)"
    puts "Quit the app(q)"
    puts "Get this message(help)"
  end

  
end

game = Runner.new
game.start