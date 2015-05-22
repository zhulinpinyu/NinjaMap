module Maps
  class Mapbox
    include YamlHelper
    attr_reader :view

    def initialize
      RMConfiguration.sharedInstance.setAccessToken(key)
      coordinate = {latitude: 22.53, longitude: 114.02}
      tile_source = RMMapboxSource.alloc.initWithMapID("mapbox.streets")
      @view = RMMapView.alloc.initWithFrame([[0,0],[200,200]], andTilesource: tile_source)
      @view.zoom = 17
      @view.centerCoordinate = coordinate2D(coordinate)
      @view.showsUserLocation = true
    end

    def marker(coordinate)
      annotation = RMPointAnnotation.alloc.initWithMapView(view, coordinate: coordinate2D(coordinate),andTitle: "Hi")
      view.addAnnotation(annotation)
    end

    private

      def key
        yaml["mapbox"]
      end

      def coordinate2D(coordinate)
        CLLocationCoordinate2DMake(coordinate[:latitude], coordinate[:longitude])
      end
  end
end