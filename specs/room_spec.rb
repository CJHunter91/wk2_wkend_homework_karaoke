require('minitest/autorun')
require('pry')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')


class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new('Chris')
    @guest2 = Guest.new('Stephen')
    @guest3 = Guest.new('Steph')
    @guest4 = Guest.new('Roman')
    @guest5 = Guest.new('Holly')
    @guest1.money = 20
    @guest2.money = 20
    @guest3.money = 20
    @guest4.money = 20
    @guest5.money = 20
    @guests = [@guest1, @guest2, @guest3]
    @guests2 = [@guest1, @guest2, @guest3, @guest4, @guest5]
    @room1 = Room.new(@guests)
    @room2 = Room.new(@guests2)
  end


  def test_is_room()
    assert_equal(@room1.class, Room.new(@guests).class)
  end

  def test_add_guest
    new_guest = Guest.new("John")
    @room1.add_guest(new_guest)
    assert_equal(true, @room1.guests.include?(new_guest))

  end

  def test_add_guest__cant_afford
    new_guest = Guest.new("John")
    new_guest.money = 5
    @room1.add_guest(new_guest)
    assert_equal(false, @room1.guests.include?(new_guest))

  end

  def test_remove_guest
    guest_count = @room1.guests.count
    @room1.remove_guest
    assert_equal(guest_count - 1, @room1.guests.count)
  end

  def test_add_song
    dance = Song.new("Dance", "Fallout")
    @room1.add_song(dance)
    assert_equal(true, @room1.songs.include?(dance))
  end

  def test_check_song
    dance = Song.new("Dance", "Fallout")
    happy = Song.new("happy", "pharrel")
    @room1.add_song(dance)
    @room1.add_song(happy)
    song = @room1.check_song
    assert_equal(dance, song)
  end

  def test_check_song__shuffles
    dance = Song.new("Dance", "Fallout")
    happy = Song.new("happy", "pharrel")
    @room1.add_song(dance)
    @room1.add_song(happy)
    @room1.check_song
    song = @room1.check_song
    assert_equal(happy, song)
  end

  def test_too_many_guests
    assert_equal(true, @room2.too_many_guests?)
  end

  def test_no_guests?
    room = Room.new
    assert_equal(true, room.no_guests?)
  end

  def test_too_many_guests__no_guest_added
    current_guests = @room1.guests
    @room1.add_guest(@guest5)
    assert_equal(current_guests, @room1.guests)
  end

  def test_take_entry_fee__can_afford
    current_wallet = @guest5.money
    expected_till = @room1.till + @room1.entry_fee
    expected_wallet = current_wallet - @room1.entry_fee
    
    @room1.take_entry_fee(@guest5)
    #test guest money is updated
    assert_equal(expected_wallet, @guest5.money)
    #test room1 till is updated
    assert_equal(expected_till, @room1.till)
  end

  def test_take_entry_fee__can_not_afford
    @guest5.money = 5
    current_wallet = @guest5.money

    @room1.take_entry_fee(@guest5)
    assert_equal(current_wallet, @guest5.money)

  end

  # def test_make_guest_tab
  #   @room1.make_guest_tab(guest_obj)
  # end

end