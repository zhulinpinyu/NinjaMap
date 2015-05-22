class AmapScreen < PM::MapScreen
  title "Amap"
  stylesheet AmapScreenStylesheet

  start_position(latitude: 22.53, longitude: 114.03, radius: 0.05)

  tap_to_add(length: 1.5, annotation: {
    title: "MLX Dropped in",
    animates_drop: true,
    action: :show_details
  })

  def on_load
    init_nav
  end

  def will_appear
    show_user_location
  end

  def annotation_data
    [{
      coordinate: CLLocationCoordinate2DMake(22.53, 114.03),
      title: "Rainbow Falls",
      subtitle: "Nantahala National Forest",
      image: UIImage.imageNamed("icon-60"),
      action: :show_details
    }]
  end

  def show_details
    selected = selected_annotations.first
  end

  def show_menu
    app_delegate.show_menu
  end

  def on_user_location(location)
    @coordinate = location.coordinate.to_a
    self.view.setCenterCoordinate(CLLocationCoordinate2DMake(@coordinate[0],@coordinate[1]),animated: false)
  end

  def tracking_location
    self.view.setCenterCoordinate(CLLocationCoordinate2DMake(@coordinate[0],@coordinate[1]),animated: true)
  end

  def init_nav
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :show_menu, type: UIBarButtonItemStylePlain
    set_nav_bar_button :right, title: UIImage.imageNamed("TrackingLocationOffMaskLandscape.png"), action: :tracking_location, type: UIBarButtonItemStylePlain
  end
end
