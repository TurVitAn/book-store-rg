RSpec.describe CouponForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:code) }
  end
end
