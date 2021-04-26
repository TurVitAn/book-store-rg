require 'ffaker'

CATEGORIES = {
  mobile_development: 'Mobile Development',
  photo: 'Photo',
  web_design: 'Web Design',
  web_development: 'Web Development'
}.freeze

CATEGORIES.each_value { |category| Category.create(name: category) } if Category.count.zero?

FactoryBot.create_list(:author, 7) if Author.count.zero?

if Book.count.zero?
  FactoryBot.create_list(:book, 50, category_id: rand(4),
                                    authors: [Author.all.sample, Author.all.sample])
end
