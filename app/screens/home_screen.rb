class HomeScreen < PM::Screen
  include LocationManager

  attr_reader :map

  title "Google Map"
  stylesheet HomeScreenStylesheet

  def on_load
    init_nav
    @map = Map.new({type: "Google"})
    location_manager
    self.view = map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
    kfc = {latitude: 22.533773, longitude: 114.029946}
    map.marker(kfc)
  end

  def show_menu
    app_delegate.show_menu
  end

  def tracking_location
    self.view.animateToCameraPosition(map.center(@coordinate))
  end

  def init_nav
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :show_menu, type: UIBarButtonItemStylePlain
    set_nav_bar_button :right, title: UIImage.imageNamed("TrackingLocationOffMaskLandscape.png"), action: :tracking_location, type: UIBarButtonItemStylePlain
  end
end
