require('minitest/autorun')
require('pry')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')


class TestGuest < MiniTest::Test
  def setup()
    @guest1 = Guest.new('Chris')
    @guest2 = Guest.new('Stephen')
  end
  def test_is_guest?
    assert_equal(@guest1.class, Guest.new('John').class)
  end









end