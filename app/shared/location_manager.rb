module LocationManager
  def location_manager
    @location_manager ||= CLLocationManager.alloc.init
    @location_manager.delegate = self
    @location_manager.desiredAccuracy = KCLLocationAccuracyNearestTenMeters
    @location_manager.requestWhenInUseAuthorization
    @location_manager.distanceFilter = 100
  end

  def locationManager(manager, didUpdateToLocation:newLocation, fromLocation:oldLocation)
    lat = newLocation.coordinate.latitude
    lon = newLocation.coordinate.longitude
    @coordinate = CoordinateTransform.wgs2gcj(lat,lon)
    if self.class.to_s == "HomeScreen"
      @marker ||= map.marker(@coordinate)
      @marker.position = CLLocationCoordinate2DMake(@coordinate[:latitude],@coordinate[:longitude])
      self.view.animateToCameraPosition(map.center(@coordinate))
    elsif self.class.to_s == "MapboxScreen"
      self.view.centerCoordinate = CLLocationCoordinate2DMake(lat,lon)
    end
  end
end