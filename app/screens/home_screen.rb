class HomeScreen < PM::Screen

  title "Google Map"
  stylesheet HomeScreenStylesheet

  def on_load
    self.view = GoogleMap.new.view
  end

end
