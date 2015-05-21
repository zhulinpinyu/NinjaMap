module CoordinateTransform
  extend self

  def wgs2gcj(wgsLat, wgsLng)
    d = delta(wgsLat, wgsLng)
    {latitude: wgsLat + d[:lat], longitude: wgsLng + d[:lng]}
  end

  def delta(lat, lng)
    a = 6378245.0
    ee = 0.00669342162296594323
    dLat = transformLat(lng-105.0, lat-35.0)
    dLng = transformLon(lng-105.0, lat-35.0)
    radLat = lat / 180.0 * Math::PI
    magic = Math.sin(radLat);
    magic = 1 - ee*magic*magic
    sqrtMagic = Math.sqrt(magic)
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * Math::PI)
    dLng = (dLng * 180.0) / (a / sqrtMagic * Math.cos(radLat) * Math::PI)
    {lat: dLat, lng: dLng}
  end

  def transformLat(x, y)
    ret = -100.0 + 2.0*x + 3.0*y + 0.2*y*y + 0.1*x*y + 0.2*Math.sqrt(x.abs);
    ret += (20.0*Math.sin(6.0*x*Math::PI) + 20.0*Math.sin(2.0*x*Math::PI)) * 2.0 / 3.0;
    ret += (20.0*Math.sin(y*Math::PI) + 40.0*Math.sin(y/3.0*Math::PI)) * 2.0 / 3.0;
    ret += (160.0*Math.sin(y/12.0*Math::PI) + 320*Math.sin(y*Math::PI/30.0)) * 2.0 / 3.0;
    return ret;
  end
 
  def transformLon(x, y)
    ret = 300.0 + x + 2.0*y + 0.1*x*x + 0.1*x*y + 0.1*Math.sqrt(x.abs);
    ret += (20.0*Math.sin(6.0*x*Math::PI) + 20.0*Math.sin(2.0*x*Math::PI)) * 2.0 / 3.0;
    ret += (20.0*Math.sin(x*Math::PI) + 40.0*Math.sin(x/3.0*Math::PI)) * 2.0 / 3.0;
    ret += (150.0*Math.sin(x/12.0*Math::PI) + 300.0*Math.sin(x/30.0*Math::PI)) * 2.0 / 3.0;
    return ret;
  end
end