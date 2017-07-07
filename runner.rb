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
        when "q"; break
      end
    end
  end
      

  def create_guest()
    return too_many if @room.too_many_guests?
    puts "Enter guest name."
    input = gets.chomp

    guest = Guest.new(input)
    too_many = "There are too many guests in the room. Remove one first"
    cant_afford = "That guest can't afford entry into this fancy establishment"
    gained_entry = "#{guest.name} has joined the room."
    puts gained_entry if @room.add_guest(guest)
    puts cant_afford if !@room.take_entry_fee(guest)

  end

  def help
    puts "You can do the following:"
    puts "---------"
    puts "Add a guest(add)"
    puts "Remove a guest(rem)"
    puts "Add a song(song)"
    puts "Quit the app(q)"
    puts "Get this message(help)"
  end

  
end

game = Runner.new
game.start