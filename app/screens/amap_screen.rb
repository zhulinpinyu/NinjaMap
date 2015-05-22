class AmapScreen < PM::MapScreen
  title "Amap"
  stylesheet AmapScreenStylesheet

  start_position(latitude: 22.53, longitude: 114.03, radius: 1)

  tap_to_add(length: 1.5, annotation: {
    title: "MLX Dropped in",
    animates_drop: true,
    action: :show_details
  })

  def on_load
    set_nav_bar_button :left, title: UIImage.imageNamed("list.png"), action: :show_menu, type: UIBarButtonItemStylePlain
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
end
