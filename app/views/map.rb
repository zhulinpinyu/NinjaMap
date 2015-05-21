class Map
  attr_reader :map

  def initialize(options={type: "Google"})
    @map = Map::Google.new
  end

  def view
    map.view
  end

  def center(coordinate={})
    map.camera(coordinate,14)
  end
end