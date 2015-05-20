class HomeScreen < PM::Screen
  include YamlHelper

  title "Google Map"
  stylesheet HomeScreenStylesheet

  def on_load
    GMSServices.provideAPIKey(key)
    camera = GMSCameraPosition.cameraWithLatitude(22.53, longitude: 114.02, zoom: 14)
    map_view = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
    map_view.myLocationEnabled = true
    self.view = map_view
  end

  private

    def key
      yaml["google_map"]
    end

end
