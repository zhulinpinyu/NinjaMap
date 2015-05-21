module LocationManager
  def location_manager
    @location_manager ||= CLLocationManager.alloc.init
    @location_manager.delegate = self
    @location_manager.desiredAccuracy = KCLLocationAccuracyNearestTenMeters
    @location_manager.requestWhenInUseAuthorization
    @location_manager.distanceFilter = 30
  end

  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    lat = newLocation.coordinate.latitude
    lon = newLocation.coordinate.longitude
    @marker ||= map.marker({latitude: lat, longitude: lon})
    @marker.position = CLLocationCoordinate2DMake(lat,lon)
    self.view.animateToCameraPosition(map.center({latitude: lat, longitude: lon}))
  end
end