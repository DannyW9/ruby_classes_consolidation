require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class GuestTest < MiniTest::Test

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

def test_can_find_guest_details
  assert_equal("Dave", @guest1.name)
  assert_equal(100, @guest1.wallet)
  assert_equal("Highway to Hell", @guest1.favourite_song)
end

def test_can_change_guest_wallet
  @guest1.wallet -= 50
  assert_equal(50, @guest1.wallet)
end

def test_guest_pays_entry
  @guest2.pay_entry(@room1)
  assert_equal(95, @guest2.wallet)
end

def test_check_for_favourite_song__has_song
  test = @guest2.check_for_favourite(@room1)
  assert_equal("Whoooooo!", test)
end

def test_check_for_favourite_song__does_not_have_song
  test = @guest1.check_for_favourite(@room1)
  assert_equal("Awwwwwh!", test)
end

def test_can_enter_room
  @guest1.enter_room(@guest1, @room1)
  assert_equal(75, @guest1.wallet)
  assert_equal(1, @room1.guests.length())
end

def test_cannot_enter_room
  @guest3.enter_room(@guest3, @room1)
  assert_equal(20, @guest3.wallet)
end




end
