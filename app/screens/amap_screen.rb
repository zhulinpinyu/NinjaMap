class AmapScreen < PM::Screen
  KEY = "key"
  title "Amap"
  stylesheet AmapScreenStylesheet

  def on_load
    init_nav
    @map = Map.new({type: "Amap"})
    self.view = @map.view
  end

  def will_appear
    
  end

  def show_menu
    app_delegate.show_menu
  end

  def init_nav
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :show_menu, type: UIBarButtonItemStylePlain
    set_nav_bar_button :right, title: UIImage.imageNamed("TrackingLocationOffMaskLandscape.png"), action: :tracking_location, type: UIBarButtonItemStylePlain
  end
end
