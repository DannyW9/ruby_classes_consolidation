require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Dave", 100, "Highway to Hell")
    @guest2 = Guest.new("Jodie", 50, "Lose Yourself")
    @guest3 = Guest.new("Nathan", 120, "Wonderwall")
    @guests = [@guest1, @guest2, @guest3]

    @song1 = Song.new("Lose Yourself", "Eminem")
    @song2 = Song.new("Wonderwall", "Oasis")
    @song3 = Song.new("Tribute", "Tenacious D")
    @songs = [@song1, @song2, @song3]


    @room1 = Room.new("Room 1", @guests, @songs)
  end

  def test_can_find_room_details
    assert_equal("Room 1", @room1.name)
    assert_equal(3, @room1.guests.length())
    assert_equal(3, @room1.songs.length())
  end




end
