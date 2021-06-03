FactoryBot.define do
  factory :admin_user do
    email { "ex#{FFaker::Internet.free_email}" }
    password { "Aa1#{FFaker::Internet.password(8)}" }
  end
end
