FactoryBot.define do
  factory :admin_user do |f|
    f.sequence(:email) { |n| "admin#{n}@gmail.com" }
    password { 'Password_2021' }
  end
end
