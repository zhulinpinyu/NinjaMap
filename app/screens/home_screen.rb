class HomeScreen < PM::Screen
  include LocationManager

  attr_reader :map

  title "Google Map"
  stylesheet HomeScreenStylesheet

  def on_load
    @map = GoogleMap.new
    location_manager
    self.view = map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
  end
end
