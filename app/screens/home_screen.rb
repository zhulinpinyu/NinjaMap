class HomeScreen < PM::Screen
  include LocationManager

  attr_reader :map

  title "Google Map"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), type: UIBarButtonItemStylePlain
    @map = Map.new({type: "Google"})
    location_manager
    self.view = map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
    kfc = {latitude: 22.533773, longitude: 114.029946}
    map.marker(kfc)
    append(UIButton,:current_location_button).on(:touch) do
      self.view.animateToCameraPosition(map.center(@coordinate))
    end
  end
end
