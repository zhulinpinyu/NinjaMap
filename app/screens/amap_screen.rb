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
    p selected.title
  end
end
