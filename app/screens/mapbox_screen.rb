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
    append(UIButton,:current_location_button).on(:touch) do
      self.view.centerCoordinate = CLLocationCoordinate2DMake(@coordinate[:latitude],@coordinate[:longitude])
    end
  end

  def show_menu
    app_delegate.show_menu
  end
end
