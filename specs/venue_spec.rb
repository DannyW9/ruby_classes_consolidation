require('minitest/autorun')
require('minitest/rg')
require_relative('../venue')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class VenueTest < MiniTest::Test

def setup
  @song1 = Song.new("Lose Yourself")
  @song2 = Song.new("Wonderwall")
  @songs = [@song1, @song2]

  @room1 = Room.new("Room 1", @songs, 0, 25)
  @room2 = Room.new("Room 2", @songs, 4, 20)
  @room3 = Room.new("Room 3", @songs, 5, 15)
  @room_list = [@room1, @room2, @room3]

  @guest1 = Guest.new("Dave", 100, "Highway to Hell")

  @venue = Venue.new(@room_list)
end


def test_can_find_room_list
  assert_equal(3, @venue.rooms_list.length())
end

def test_check_for_room_with_space__second_room
  room = @venue.check_for_room_with_space
  assert_equal("Room 2", room.name)
end

def test_add_guest_to_first_room
  @venue.add_guest_to_first_room(@guest1)
  assert_equal(1, @room2.guests.length())
  assert_equal(80, @guest1.wallet)
  assert_equal(20, @room2.till)
end

# def test_add_guest_to_first_available_room__second_room
#   test = @venue.add_guest_to_first_available(@guest1)
#   assert_equal(1, test)
# end



end
