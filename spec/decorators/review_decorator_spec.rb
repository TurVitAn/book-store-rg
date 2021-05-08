RSpec.describe ReviewDecorator do
  let(:review) { build(:review).decorate }

  describe '#user_logo' do
    let(:creation_user_logo_result) { review.user.email.first }

    it 'returns first letter from email to logo' do
      expect(review.user_logo).to eq(creation_user_logo_result)
    end
  end

  describe '#creation_date' do
    let(:creation_date_result) { review.created_at.strftime('%d/%m/%y') }

    it 'returns date in format d/m/y' do
      expect(review.creation_date).to eq(creation_date_result)
    end
  end

  describe '#username' do
    let(:creation_username_result) { review.user.email.split(/@/).first }

    it 'returns username as email to /@/' do
      expect(review.username).to eq(creation_username_result)
    end
  end
end
