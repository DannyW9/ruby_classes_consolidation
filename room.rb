class Room

attr_reader :name, :songs, :capacity, :entry_fee
attr_accessor :guests


def initialize(name, songs, capacity, entry_fee)
  @name = name
  @songs = songs
  @capacity = capacity
  @entry_fee = entry_fee
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

def check_current_space()
  return true if @guests.length() < @capacity
  return false if @guests.length() >= @capacity
end

def afford_entry(guest)
  return true if guest.wallet >= @entry_fee
  return false if guest.wallet < @entry_fee
end

def add_guest_to_room(guest)
  if check_current_space() == true
  @guests.push(guest)
end
  return "Sorry, no space!"
end



end
