class Room

attr_reader :name, :songs, :capacity
attr_accessor :guests


def initialize(name, songs, capacity)
  @name = name
  @songs = songs
  @capacity = capacity
  @guests = []
end

def remove_guest_from_room(guest)
  @guests.delete(guest)
end

def add_song_to_room(song)
  @songs.push(song)
end

def remove_song_from_room(song)
  @songs.delete(song)
end

def check_current_space
  @capacity -= @guests.length()
end

def add_guest_to_room(guest)
  if @guests.length() < @capacity
  @guests.push(guest)
end
  return "Sorry, no space!"
end



end
