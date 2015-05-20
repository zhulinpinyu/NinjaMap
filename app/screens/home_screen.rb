class HomeScreen < PM::Screen
  attr_reader :map
  title "Google Map"
  stylesheet HomeScreenStylesheet

  def on_load
    @map = GoogleMap.new
    location_manager
    self.view = map.view
  end

  def will_appear
    @location_manager.startUpdatingLocation
  end

  def location_manager
    @location_manager ||= CLLocationManager.alloc.init
    @location_manager.delegate = self
    @location_manager.desiredAccuracy = KCLLocationAccuracyNearestTenMeters
    @location_manager.requestWhenInUseAuthorization
    @location_manager.distanceFilter = 10
  end

  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    lat = newLocation.coordinate.latitude
    lon = newLocation.coordinate.longitude
    self.view.animateToCameraPosition(map.camera({latitude: lat, longitude: lon},14))
  end
end
