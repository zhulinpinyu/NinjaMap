class HomeScreen < PM::Screen
  include LocationManager

  attr_reader :map

  title "Google Map"
  stylesheet HomeScreenStylesheet

  def on_load
    @map = MapManager.new({type: "Google"}).map
    location_manager
    self.view = map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
  end
end
