class AppDelegate < PM::Delegate
  include CDQ

  status_bar true, animation: :fade

  def on_load(app, options)
    cdq.setup
    open HomeScreen.new(nav_bar: true)
  end
end
