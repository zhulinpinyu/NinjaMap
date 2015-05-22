class MapboxScreen < PM::Screen
  include LocationManager

  attr_reader :map

  title "Mapbox"
  stylesheet MapboxScreenStylesheet

  def on_load
    init_nav
    location_manager
    @map = Map.new({type: "Mapbox"})
    self.view = map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
    kfc = {latitude: 22.5365675788, longitude: 114.0248910542}
    map.marker(kfc)
  end

  def show_menu
    app_delegate.show_menu
  end

  def tracking_location
    self.view.centerCoordinate = CLLocationCoordinate2DMake(@coordinate[:latitude],@coordinate[:longitude])
  end

  def init_nav
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :show_menu, type: UIBarButtonItemStylePlain
    set_nav_bar_button :right, title: UIImage.imageNamed("TrackingLocationOffMaskLandscape.png"), action: :tracking_location, type: UIBarButtonItemStylePlain
  end
end
