require './lib/room'

class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price.to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category_given)
    types = @rooms.group_by do |room|
      room.category
    end
    types[category_given]
  end

  def area
    all_area = @rooms.map do |room|
      room.area
    end
    total_area = 0
    all_area.each do |area|
      total_area += area
    end
    total_area
  end

  def details
    house_details = {}
    house_details["price"] = @price.delete('$').to_i
    house_details["address"] = @address
    house_details
  end
end
