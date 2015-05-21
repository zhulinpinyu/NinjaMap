class MapboxScreen < PM::Screen
  include LocationManager

  attr_reader :map

  title "Mapbox"
  stylesheet MapboxScreenStylesheet

  def on_load
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :show_menu, type: UIBarButtonItemStylePlain
    location_manager
    @map = Map.new({type: "Mapbox"})
    self.view = map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
  end

  def show_menu
    app_delegate.show_menu
  end
end
