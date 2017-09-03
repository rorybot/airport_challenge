require_relative 'plane'
require_relative 'runway'

class Airport

  include Runway
  include Weather

  def initialize(capacity = DEFAULT_CAPACITY)
    new_runway(capacity)
  end

  def land(plane)
    fail "This plane is already landed" if plane_is_already_landed?(plane)
    fail "We're too full - go land somewhere else!" if runway_at_capacity?
    fail "Storm! Do not land here!" if it_is_stormy?
    add_plane_to_runway(plane)
  end

  def take_off(plane)
    unless plane_is_already_landed?(plane)
      nil
    else
      fail "Storm! Do not take off!" if it_is_stormy?
      remove_plane_from_runway(plane)
    end
  end

  def set_name(new_name)
    @new_name = "Heathrow"
  end

  private

  def remove_plane_from_runway(plane)
    runway_traffic.delete(plane)
  end

  def add_plane_to_runway(plane)
    runway_traffic << plane
  end

  def it_is_stormy?
    stormy? == true
  end

  def runway_at_capacity?
    runway_traffic.count >= runway_capacity
  end

end
