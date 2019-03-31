require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class SongTest < MiniTest::Test

def setup
  @song1 = Song.new("Lose Yourself")
end

def test_can_find_song_details
  assert_equal("Lose Yourself", @song1.title)
end


end
