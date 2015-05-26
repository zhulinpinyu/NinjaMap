module Maps
  class Amap
    include YamlHelper
    attr_reader :map_view, :bounds

    def initialize
      MAMapServices.sharedServices.apiKey = key
    end

    def view
      coordinate = {latitude: 22.53, longitude: 114.02}
      @map_view = MAMapView.alloc.initWithFrame([[0,0],[200,200]])
      @map_view.setCenterCoordinate(coordinate2D(coordinate))
      @map_view.setZoomLevel(17, animated: false)
      @map_view.showsScale = false
      @map_view.compassOrigin = CGPointMake(@map_view.compassOrigin.x, 22)
      @map_view.showsUserLocation = true
      @map_view.setUserTrackingMode(MAUserTrackingModeFollow,animated: true)
      #map_view.delegate = self
      @map_view
    end

    def center(coordinate)
      map_view.setCenterCoordinate(coordinate2D(coordinate))
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
