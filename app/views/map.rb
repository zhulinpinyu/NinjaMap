class Map
  attr_reader :map

  def initialize(options={type: "Google"})
    ##
    # Not Work
    ##
    #@map = Kernel.const_get("Maps::#{options[:type]}").new
    #@map = Object.const_get("Maps::#{options[:type]}").new

    ##
    # Work well (not Maps module in file)
    ##
    #@map = Kernel.const_get("#{options[:type]}").new
    #@map = Object.const_get("#{options[:type]}").new

    @map = clazz_instance(options[:type])
  end

  def view
    map.view
  end

  def center(coordinate={})
    map.center(coordinate)
  end

  def marker(coordinate={})
    map.marker(coordinate)
  end

  private

    def clazz_instance(type)
      case type
      when "Google"
        Maps::Google.new
      when "Mapbox"
        Maps::Mapbox.new
      when "Amap"
        Maps::Amap.new
      end
    end
end