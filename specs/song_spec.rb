require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class SongTest < MiniTest::Test

def setup
  @song1 = Song.new("Lose Yourself", "Eminem")
end

def test_can_find_song_details
  assert_equal("Lose Yourself", @song1.title)
  assert_equal("Eminem", @song1.artist)
end


end
