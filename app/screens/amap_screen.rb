class AmapScreen < PM::Screen
  include LocationManager

  attr_reader :map

  title "Amap"
  stylesheet AmapScreenStylesheet

  def on_load
    init_nav
    location_manager
    @map = Map.new({type: "Amap"})
    self.view = @map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
    kfc = {latitude: 22.533773, longitude: 114.029946}
    map.marker(kfc)
    map.marker({latitude: 22.535, longitude: 114.03})
    map.marker({latitude: 22.535, longitude: 114.032})
  end

  # def show_menu
  #   app_delegate.show_menu
  # end
  def offline_map
    open OfflineAmapScreen.new(nav_bar: true)
  end

  def tracking_location
    self.view.setCenterCoordinate(CLLocationCoordinate2DMake(@coordinate[:latitude],@coordinate[:longitude]), animated: true)
  end

  def init_nav
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :offline_map, type: UIBarButtonItemStylePlain
    set_nav_bar_button :right, title: UIImage.imageNamed("TrackingLocationOffMaskLandscape.png"), action: :tracking_location, type: UIBarButtonItemStylePlain
  end
end
