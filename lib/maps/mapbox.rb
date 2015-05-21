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
      @view.centerCoordinate = CLLocationCoordinate2DMake(coordinate[:latitude], coordinate[:longitude])
      @view.showsUserLocation = true
    end

    private

      def key
        yaml["mapbox"]
      end
  end
end