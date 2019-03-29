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

end
