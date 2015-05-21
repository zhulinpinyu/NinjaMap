class MapboxScreen < PM::Screen
  include YamlHelper

  title "Mapbox"
  stylesheet MapboxScreenStylesheet

  def on_load
    RMConfiguration.sharedInstance.setAccessToken(yaml[:mapbox])
    tile_source = RMMapboxSource.alloc.initWithMapID("mapbox.streets")
    map_view = RMMapView.alloc.initWithFrame(self.view.bounds, andTilesource: tile_source)
    map_view.zoom = 17
    map_view.centerCoordinate = CLLocationCoordinate2DMake(22.53,114.02)
    self.view = map_view
  end
end
