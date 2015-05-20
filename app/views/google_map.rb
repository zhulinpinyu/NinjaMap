class GoogleMap
  include YamlHelper

  def initialize
    GMSServices.provideAPIKey(key)
  end

  def view
    camera = GMSCameraPosition.cameraWithLatitude(22.53, longitude: 114.02, zoom: 14)
    @map_view = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
    @map_view.myLocationEnabled = true
    @map_view
  end

  private

    def key
      yaml["google_map"]
    end
end