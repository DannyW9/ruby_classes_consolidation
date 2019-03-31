class Venue

attr_reader :rooms_list

def initialize(rooms_list)
  @rooms_list = rooms_list
end


def add_guest_to_first_available(guest)
  @rooms_list.each do |room|
    if room.guests.length() < room.capacity
      room.add_guest_to_first_room(guest)
    end
  end
end


end


# check each rooms guest array with each rooms occupancy. If full, pass to the next

#check current space and get back an array eg. [false, true, true]
# if false, move to next one
#if true, add guest to that particular room
# match index of first array to the array of rooms? and add by index?

# loop through array.
# compare each rooms occupancy to its guest list
