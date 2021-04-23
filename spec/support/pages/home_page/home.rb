module Pages
  module HomePage
    class Home < SitePrism::Page
      set_url '/'

      section :header, Sections::Layouts::Header, 'header'
      section :slider, Sections::Pages::Slider, '#slider'
      section :get_started, Sections::Pages::GetStarted, 'div.jumbotron'
      section :footer, Sections::Layouts::Footer, 'footer'
    end
  end
end
