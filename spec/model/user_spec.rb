require "rails_helper"

RSpec.describe User, type: :model do
  before(:all) do
    @user = FactoryBot.create(:user, :with_default_password)
  end

  context 'should login success with correct params' do
    let(:result) do
      if User.authenticate(@user.email, User::TEST_DEFAULT_PASSWORD)
        @user.grant_user_access
        @user
      end
    end

    it 'and return login success' do
      expect(result.present?).to be_truthy
    end

    it 'and return access_token' do
      expect(result.access_token).to be_truthy
    end

    it 'and return correct user' do
      expect(result.email).to eq(@user.email)
    end
  end
end
