class Venue

attr_reader :rooms_list

def initialize(rooms_list)
  @rooms_list = rooms_list
end

####### adding guest to first room with space available

def check_for_room_with_space
  @rooms_list.each do |room|
    if room.guests.length() < room.capacity
      return room
    end
  end
end

def add_guest_to_first_room(guest)
  room = check_for_room_with_space()
  if room.afford_entry(guest) == true
    guest.pay_entry(room)
    room.add_fee_to_room
    room.guests.push(guest)
  end
end

############# adding entire groups of guests to rooms

def check_room_for_group(group)
  @rooms_list.each do |room|
    if ((room.capacity - room.guests.length()) > group.length())
      return room
    end
  end
end

def total_group_funds(group)
  total_funds = 0
  group.each { |person| total_funds += person.wallet }
  return total_funds
end

def group_afford_entry(group)
  room = check_room_for_group(group)
  return true if total_group_funds(group) >= (room.entry_fee * group.length())
  return false if total_group_funds(group) < (room.entry_fee * group.length())
end

def add_group_to_room(group)
  room = check_room_for_group(group)
  if group_afford_entry(group) == true
    group.each { |person| room.guests << person}
  end
end

def add_group_fee(group)
  room = check_room_for_group(group)
  room.till += (room.entry_fee * group.length())
end

# def add_guest_to_first_available(guest)
#   @rooms_list.each do |room|
#     if room.guests.length() < room.capacity
#       return room
#       # room.add_guest_to_first_room(guest)
#     end
#   end
# end


end


# check each rooms guest array with each rooms occupancy. If full, pass to the next

#check current space and get back an array eg. [false, true, true]
# if false, move to next one
#if true, add guest to that particular room
# match index of first array to the array of rooms? and add by index?

# loop through array.
# compare each rooms occupancy to its guest list
