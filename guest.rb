class Guest

  attr_reader :name, :favourite_song
  attr_accessor :wallet

def initialize(name, wallet, favourite_song)
  @name = name
  @wallet = wallet
  @favourite_song = favourite_song
end

end
