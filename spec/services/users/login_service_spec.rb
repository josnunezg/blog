RSpec.describe Users::LoginService do
  subject(:service) { described_class.call(email: email, password: password) }

  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  describe '.call' do
    context 'when user does not exist' do
      it 'expected service is not success' do
        expect(service).not_to be_success
      end

      it 'expected to service returns an error' do
        expect(service.error).not_to be_nil
      end

      it 'expected to service returns a correct error' do
        expect(service.error).to include(Error.user_or_password_invalid)
      end
    end

    context 'when user exists but the password is invalid' do
      let(:user) { create(:user) }
      let(:email) { user.email }

      it 'expected service is not success' do
        expect(service).not_to be_success
      end

      it 'expected service returns an error' do
        expect(service.error).not_to be_nil
      end

      it 'expected service returns a correct error' do
        expect(service.error).to include(Error.user_or_password_invalid)
      end
    end

    context 'when user exists and password is correct' do
      let(:user) { create(:user) }
      let(:email) { user.email }
      let(:password) { user.password }

      it 'expected service is success' do
        expect(service).to be_success
      end

      it 'returns a token' do
        expect(service.token).not_to be_nil
      end
    end
  end
end
