class Google
  include YamlHelper

  def initialize
    GMSServices.provideAPIKey(key)
  end

  def view
    coordinate = {latitude: 22.53, longitude: 114.02}
    map_view = GMSMapView.mapWithFrame(CGRectZero, camera: center(coordinate))
    map_view.myLocationEnabled = true
    map_view
  end

  def center(coordinate)
    GMSCameraPosition.cameraWithLatitude(coordinate[:latitude], longitude: coordinate[:longitude], zoom: 14)
  end

  private

    def key
      yaml["google_map"]
    end
end