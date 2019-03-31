require('minitest/autorun')
require('minitest/rg')
require_relative('../venue')
require_relative('../room')
require_relative('../song')

class VenueTest < MiniTest::Test

def setup

@song1 = Song.new("Lose Yourself")
@song2 = Song.new("Wonderwall")
@songs = [@song1, @song2]

@room1 = Room.new("Room 1", @songs, 3, 25)
@room2 = Room.new("Room 2", @songs, 4, 20)
@room3 = Room.new("Room 3", @songs, 5, 15)
@room_list = [@room1, @room2, @room3]

@venue = Venue.new(@room_list)





end

def test_can_find_room_list
  assert_equal(3, @venue.rooms_list.length())
end



end
