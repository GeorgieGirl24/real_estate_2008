require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_a_price
    # skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal "$400000", house.price
  end

  def test_it_has_an_address
    # skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_it_has_no_rooms_to_begin_with
    # skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_a_room_can_be_added
    # skips
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')

    house.add_room(room_1)

    assert_equal [room_1], house.rooms
  end

  def test_rooms_can_be_added
    # skip
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_it_can_test_if_the_house_is_above_average
    # skip
    house = House.new("$400000", "123 sugar lane")
    assert_equal false, house.above_market_average?
  end

  def test_it_can_group_rooms_by_their_category
    # skip
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    house.rooms_from_category(:bedroom)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
  end

  def test_it_can_figure_out_the_total_area_of_rooms_in_a_house
    # skip
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end
  def test_it_can_show_the_details_of_the_house
    # skip
    house = House.new("$400000", "123 sugar lane")

    answer = {"price" => 400000, "address" => "123 sugar lane"}
    assert_equal answer, house.details
  end


end
