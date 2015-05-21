module Maps
  class Google
    include YamlHelper
    attr_reader :map_view

    def initialize
      GMSServices.provideAPIKey(key)
    end

    def view
      coordinate = {latitude: 22.53, longitude: 114.02}
      @map_view = GMSMapView.mapWithFrame(CGRectZero, camera: center(coordinate))
      @map_view.myLocationEnabled = false
      @map_view.settings.myLocationButton = true
      @map_view
    end

    def center(coordinate)
      GMSCameraPosition.cameraWithLatitude(coordinate[:latitude], longitude: coordinate[:longitude], zoom: 14)
    end

    def marker(coordinate)
      marker = GMSMarker.alloc.init
      marker.position = CLLocationCoordinate2DMake(coordinate[:latitude], coordinate[:longitude])
      marker.map = map_view
    end

    private

      def key
        yaml["google_map"]
      end
  end
end
