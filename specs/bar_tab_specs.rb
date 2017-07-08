require('minitest/autorun')
require('pry')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')
require_relative('../bar_tab.rb')

class TestBarTab < MiniTest::Test


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
    @room_tab = BarTab.new
    @room1 = Room.new(@guests)

  end

  def test_add_to_customer_tab__customer_not_added
    amount = 10
    @room_tab.add_to_customer_tab(@guest1, amount)
    assert_equal(amount, @room_tab.guest_tabs[@guest1])
  end

  def test_add_to_customer_tab__customer_exists
    amount = 10
    @room_tab.add_to_customer_tab(@guest1, amount)
    @room_tab.add_to_customer_tab(@guest1, amount)
    assert_equal(20 , @room_tab.guest_tabs[@guest1])
  end








end