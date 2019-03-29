class Room

attr_reader :name, :songs, :guests


def initialize(name, guests, songs)
  @name = name
  @guests = guests
  @songs = songs
end

end
