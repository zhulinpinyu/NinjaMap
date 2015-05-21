class NavigationScreen < PM::TableScreen
  title "Menu"

  def table_data
    [{
      title: nil,
      cells: [{
        title: "Home",
        action: :swap_center_controller,
        arguments: HomeScreen.new(nav_bar: true)
      }]
    }]
  end

  def swap_center_controller(screen)
    app_delegate.menu.center_controller = screen
    app_delegate.menu.hide
  end
end