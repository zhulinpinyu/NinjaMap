class AppDelegate < PM::Delegate
  include CDQ

  status_bar true, animation: :fade

  def on_load(app, options)
    cdq.setup
    @menu = open MenuDrawer
  end

  def show_menu
    @menu.show :left
  end
end
