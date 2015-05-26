module Maps
  class Amap
    include YamlHelper
    attr_reader :map_view, :bounds

    def initialize(options)
      MAMapServices.sharedServices.apiKey = key
      @bounds = options[:bounds]
    end

    def view
      coordinate = {latitude: 22.53, longitude: 114.02}
      @map_view = MAMapView.alloc.initWithFrame(bounds)
      @map_view.setCenterCoordinate(coordinate2D(coordinate))
      @map_view.setZoomLevel(17, animated: false)
      #map_view.delegate = self
      @map_view
    end

    def center(coordinate)
      #GMSCameraPosition.cameraWithLatitude(coordinate[:latitude], longitude: coordinate[:longitude], zoom: 16)
    end

    def marker(coordinate)
      # marker = GMSMarker.alloc.init
      # marker.position = CLLocationCoordinate2DMake(coordinate[:latitude], coordinate[:longitude])
      # marker.map = map_view
      # marker
    end

    private

      def key
        yaml["amap"]
      end

      def coordinate2D(coordinate)
        CLLocationCoordinate2DMake(coordinate[:latitude], coordinate[:longitude])
      end
  end
end
