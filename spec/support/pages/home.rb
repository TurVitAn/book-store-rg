module Pages
  class Home < SitePrism::Page
    set_url '/'

    section :header, Sections::Header, 'header'
    section :slider, Sections::Slider, '#slider'
    section :get_started, Sections::GetStarted, 'div.jumbotron'
    section :footer, Sections::Footer, 'footer'
  end
end
