FactoryBot.define do
  factory :order do
    number do
      Checkouts::ConfirmService::NUMBER_BEGIN +
        Array.new(Checkouts::ConfirmService::NUMBER_SIZE) { rand(Checkouts::ConfirmService::NUMBER_RANGE) }.join
    end

    user
  end
end
