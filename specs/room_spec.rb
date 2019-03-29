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
    @guest4 = Guest.new("Nathan", 120, "Wonderwall")
    @guest5 = Guest.new("Nathan", 120, "Wonderwall")

    @song1 = Song.new("Lose Yourself", "Eminem")
    @song2 = Song.new("Wonderwall", "Oasis")
    @song3 = Song.new("Tribute", "Tenacious D")
    @songs = [@song1, @song2]


    @room1 = Room.new("Room 1", @songs, 3)
  end

  def test_can_find_room_details
    assert_equal("Room 1", @room1.name)
    assert_equal(0, @room1.guests.length())
    assert_equal(2, @room1.songs.length())
    assert_equal(3, @room1.capacity)
  end

  def test_can_add_guest_to_room
    @room1.add_guest_to_room(@guest1)
    assert_equal(1, @room1.guests.length())
  end

  def test_can_remove_guest_from_room
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.remove_guest_from_room(@guest1)
    assert_equal(1, @room1.guests.length())
  end

  def test_can_add_song_to_room
    @room1.add_song_to_room(@song3)
    assert_equal(3, @room1.songs.length())
  end

  def test_can_remove_song_from_room
    @room1.remove_song_from_room(@song1)
    assert_equal(1, @room1.songs.length())
  end

  def test_current_space_in_room
    @room1.add_guest_to_room(@guest1)
    assert_equal(2, @room1.check_current_space)
  end

  def test_cannot_add_guest__no_space
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    @room1.add_guest_to_room(@guest4)
    assert_equal("Sorry, no space!", @room1.add_guest_to_room(@guest5))
    assert_equal(3, @room1.guests.length())
    assert_equal(0, @room1.check_current_space)
  end

end
