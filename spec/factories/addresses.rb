FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    address { FFaker::Address.street_name }
    city { FFaker::Address.city }
    zip_code { FFaker::AddressUA.zip_code }
    country { 'Ukraine' }
    phone { FFaker::PhoneNumberUA.international_mobile_phone_number.delete(' -') }
    address_type { 'billing' }

    trait :for_user do
      association :addressable, factory: :user
    end
  end
end
