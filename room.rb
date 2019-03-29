class Room

attr_reader :name, :songs
attr_accessor :guests


def initialize(name, songs)
  @name = name
  @songs = songs
  @guests = []
end

def add_guest_to_room(guest)
  @guests.push(guest)
end

def remove_guest_from_room(guest)
  @guests.delete(guest)
end

def add_song_to_room(song)
  @songs.push(song)
end

end
