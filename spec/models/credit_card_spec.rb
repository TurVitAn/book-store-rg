RSpec.describe CreditCard, type: :model do
  describe 'with associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:order_id) }
  end
end
