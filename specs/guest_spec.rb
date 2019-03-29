require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')

class GuestTest < MiniTest::Test

def setup
  @guest1 = Guest.new("Dave", 100, "Highway to Hell")
  @guest1 = Guest.new("Jodie", 20, "Wonderwall")
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





end
