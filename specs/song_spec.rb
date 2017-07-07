require('minitest/autorun')
require('pry')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')


class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Beat It", "Michael Jackson")
    @song2 = Song.new("Break Free", "Queen")
  end

  def test_is_song()
    assert_equal(@song2.class, Song.new("some", "Thing").class)
  end











end