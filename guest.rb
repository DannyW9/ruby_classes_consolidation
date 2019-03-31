class Guest

  attr_reader :name, :favourite_song
  attr_accessor :wallet

def initialize(name, wallet, favourite_song)
  @name = name
  @wallet = wallet
  @favourite_song = favourite_song
end

def check_for_favourite(room)
  playlist = room.create_playlist_of_titles
  if playlist.find { |song| song == @favourite_song}
    return "Whoooooo!"
  else
    return "Awwwwwh!"
  end
end



end
