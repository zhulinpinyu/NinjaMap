class Map
  attr_reader :map

  def initialize(options={type: "Google"})
    @map = Object.const_get("#{options[:type]}").new
  end

  def view
    map.view
  end

  def center(coordinate={})
    map.center(coordinate)
  end
end