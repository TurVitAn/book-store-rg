RSpec.describe ReviewDecorator do
  let(:review) { build(:review).decorate }

  describe '#creation_date' do
    let(:creation_date_result) { review.created_at.strftime(I18n.t('reviews.creation_date')) }

    it 'returns date in format d/m/y' do
      expect(review.creation_date).to eq(creation_date_result)
    end
  end

  describe '#username' do
    let(:creation_username_result) { review.user.email }

    it 'returns default username' do
      expect(review.username).to eq(creation_username_result)
    end
  end

  describe '#first_letter_username' do
    let(:creation_first_letter_username_result) { review.username.first }

    it 'returns first letter from username' do
      expect(review.first_letter_username).to eq(creation_first_letter_username_result)
    end
  end
end
