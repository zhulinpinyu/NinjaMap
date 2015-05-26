class OfflineAmapScreen < PM::TableScreen
  attr_reader :cities

  title "Offline Amap"
  searchable(placeholder: "搜索城市")

  def on_load
    @cities = MAOfflineMap.sharedOfflineMap.cities
  end

  def table_data
    [{
      title: "城市",
      cells: cities.map do |city|
        {
          title: city.name,
          subtitle: status(city),
          action: :download,
          arguments: city
        }
      end
    }]
  end

  def download(item)
    MAOfflineMap.sharedOfflineMap.downloadItem(item,shouldContinueWhenAppEntersBackground:true,downloadBlock: nil)
  end

  def status(city)
    size = (city.size/1024.0/1024.0).round(2)
    status = city.status
    status_array = ["未下载","正在下载","已下载","已过期"]
    "#{size}MB #{status_array[status]}"
  end
end