RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value(Faker::Internet.email).for(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
