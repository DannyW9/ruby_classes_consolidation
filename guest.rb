class Guest

  attr_reader :name, :favourite_song
  attr_accessor :wallet

def initialize(name, wallet, favourite_song)
  @name = name
  @wallet = wallet
  @favourite_song = favourite_song
end

def pay_entry(room)
  @wallet -= room.entry_fee
end

def check_for_favourite(room)
  playlist = room.create_playlist_of_titles
  if playlist.find { |song| song == @favourite_song}
    return "Whoooooo!"
  else
    return "Awwwwwh!"
  end
end

def enter_room(guest, room)
  room.add_guest_to_room(guest)
  guest.pay_entry(room)
end



end
