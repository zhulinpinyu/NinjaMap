class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def current_location_button(st)
    st.frame = {grid: "k16", r:10, w: 45, h: 45}
    st.background_image = image.resource("position")
  end

end
