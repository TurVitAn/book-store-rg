RSpec.describe BookForm, type: :model do
  context 'with validations' do
    %i[category_id title description price height width depth materials published_at].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end

    it { is_expected.to validate_length_of(:title).is_at_most(described_class::TITLE_MAX_SIZE) }
    it { is_expected.to validate_length_of(:description).is_at_least(described_class::DESCRIPTION_MIN_SIZE) }

    %i[price height width depth].each do |field|
      it { is_expected.to validate_numericality_of(field).is_greater_than_or_equal_to(0) }
    end
  end
end
