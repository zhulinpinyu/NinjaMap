class MapManager
  attr_reader :map

  def initialize(options={type: "Google"})
    @map = Map::Google.new
  end
end