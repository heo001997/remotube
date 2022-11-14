require 'rails_helper'

RSpec.describe UsersController do
  before(:all) do
    @user = FactoryBot.create(:user, :authenticated_user)
  end

  context 'should get me user success with correct params' do
    let(:result) do
      @request.headers['Authorization'] = @user.access_token
      get :me
      response
    end
    let(:response_body) do
      JSON.parse(result.body, symbolize_names: true)
    end

    it 'and return status 200' do
      expect(result.status).to eq(200)
    end

    it 'and return correct user me' do
      expect(response_body[:records][:email]).to eq(@user.email)
    end
  end
end
