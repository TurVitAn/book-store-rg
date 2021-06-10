require 'ffaker'

CATEGORIES = {
  mobile_development: 'Mobile Development',
  photo: 'Photo',
  web_design: 'Web Design',
  web_development: 'Web Development'
}.freeze

CATEGORIES.each_value { |category| Category.create(name: category) } unless Category.exists?

FactoryBot.create_list(:author, 7) unless Author.exists?

unless Book.exists?
  50.times do
    FactoryBot.create(:book, category_id: rand(1..4), authors: [Author.all.sample, Author.all.sample])
  end
end

unless AdminUser.exists?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
