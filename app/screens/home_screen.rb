class HomeScreen < PM::Screen
  include YamlHelper

  title "Your title here"
  stylesheet HomeScreenStylesheet

  def on_load
    
  end

  private

    def key
      yaml["google_map"]
    end

end
