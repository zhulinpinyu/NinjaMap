class AmapScreen < PM::Screen
  include LocationManager

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
