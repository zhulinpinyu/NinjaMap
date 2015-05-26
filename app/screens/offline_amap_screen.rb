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
    BW::UIAlertView.new({
      message: "下载 #{item.name} 的离线地图?",
      buttons: ['取消','下载'],
      cancel_button_index: 0
    }) do |alert|
      unless alert.clicked_button.cancel?
        MAOfflineMap.sharedOfflineMap.downloadItem(item,shouldContinueWhenAppEntersBackground:true,downloadBlock: nil)
      end
    end.show
  end

  def status(city)
    size = (city.size/1024.0/1024.0).round(2)
    status = city.status
    status_array = ["未下载","正在下载","已下载","已过期"]
    "#{size}MB #{status_array[status]}"
  end
end