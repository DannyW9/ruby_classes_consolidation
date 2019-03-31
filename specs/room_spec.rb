require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Dave", 100, "Highway to Hell")
    @guest2 = Guest.new("Jodie", 120, "Lose Yourself")
    @guest3 = Guest.new("Nathan", 20, "Wonderwall")

    @song1 = Song.new("Lose Yourself")
    @song2 = Song.new("Wonderwall")
    @song3 = Song.new("Tribute")
    @songs = [@song1, @song2]


    @room1 = Room.new("Room 1", @songs, 3, 25)
  end

  def test_can_find_room_details
    assert_equal("Room 1", @room1.name)
    assert_equal(0, @room1.guests.length())
    assert_equal(2, @room1.songs.length())
    assert_equal(3, @room1.capacity)
  end

  def test_can_add_fee_to_till
    @room1.add_fee_to_room
    assert_equal(25, @room1.till)
  end

  def test_can_add_guest_to_room
    @room1.add_guest_to_room(@guest1, @room1)
    assert_equal(1, @room1.guests.length())
    assert_equal(25, @room1.till)
    assert_equal(75, @guest1.wallet)
  end

  def test_can_remove_guest_from_room
    @room1.add_guest_to_room(@guest1, @room1)
    @room1.add_guest_to_room(@guest2, @room1)
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

  def test_create_playlist_of_titles
    test = @room1.create_playlist_of_titles
    assert_equal(["Lose Yourself", "Wonderwall"], test)
  end

  def test_does_room_have_space
    @room1.add_guest_to_room(@guest1, @room1)
    assert_equal(true, @room1.check_current_space)
  end

  def test_cannot_add_guest__no_space
    @room1.add_guest_to_room(@guest1, @room1)
    @room1.add_guest_to_room(@guest1, @room1)
    @room1.add_guest_to_room(@guest1, @room1)
    @room1.add_guest_to_room(@guest1, @room1)
    assert_equal(3, @room1.guests.length())
    assert_equal(false, @room1.check_current_space)
    assert_equal(75, @room1.till)
  end

  def test_can_guest_afford_entry__can_afford
    assert_equal(true, @room1.afford_entry(@guest1))
  end

  def test_can_guest_afford_entry__cannot_afford
    assert_equal(false, @room1.afford_entry(@guest3))
  end

  def test_cannot_add_guest__cannot_afford_entry
    @room1.add_guest_to_room(@guest3, @room1)
    assert_equal(0, @room1.guests.length())
    assert_equal(true, @room1.check_current_space)
    assert_equal(0, @room1.till)
    assert_equal(100, @guest1.wallet)
  end


end
