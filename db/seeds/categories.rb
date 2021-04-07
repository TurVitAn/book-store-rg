CATEGORIES = {
  web_design: 'Веб дизайн',
  web_development: 'Веб розробка',
  mobile_development: 'Мобільна розробка',
  photo: 'Фото'
}.freeze

CATEGORIES.each_value { |category| Category.create(name: category) } if Category.count.zero?
