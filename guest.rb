class Guest

  attr_reader :name, :favourite_song
  attr_accessor :wallet

def initialize(name, wallet, favourite_song)
  @name = name
  @wallet = wallet
  @favourite_song = favourite_song
end

def check_for_favourite(room)
  room.songs.include?(@favourite_song)
end


#use find. make the room.songs array function inside room.rb



#   song = room.songs.select { |title| title == @favourite_song}
#   if song == @favourite_song
#     return "Whoooooo!"
#   end
# end

#   for title in room
#     if title.songs == @favourite_song
#       return "Whoooooo!"
#     end
#   end
# end


end
