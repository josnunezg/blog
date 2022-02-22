RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should have_many(:comments) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(500) }
  end
end
