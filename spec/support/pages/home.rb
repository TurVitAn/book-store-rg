module Pages
  class Home < SitePrism::Page
    set_url '/'

    section :header, Sections::Header, 'header'
    section :footer, Sections::Footer, 'footer'
    section :get_started, Sections::GetStarted, 'div.jumbotron'
    section :slider, Sections::Slider, '#slider'
  end
end
