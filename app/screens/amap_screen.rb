class AmapScreen < PM::Screen
  title "Amap"
  stylesheet AmapScreenStylesheet

  def on_load
    init_nav
    @map = Map.new({type: "Amap",bounds: self.view.bounds})
    self.view = @map.view
  end

  # def show_menu
  #   app_delegate.show_menu
  # end
  def offline_map
    open OfflineAmapScreen.new(nav_bar: true)
  end

  def init_nav
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :offline_map, type: UIBarButtonItemStylePlain
    set_nav_bar_button :right, title: UIImage.imageNamed("TrackingLocationOffMaskLandscape.png"), action: :tracking_location, type: UIBarButtonItemStylePlain
  end
end
