# frozen_string_literal: true
require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'USERS API' do
    before do
      @user = create(:user)
      get '/api/v1/users'
    end
    it 'get/index' do
      expect(response).to be_successful
    end

    it 'Create Api' do
      post '/api/v1/users', params: { user: { email: 'aadi@gmail.com', password: 'aadi1234' } }
      expect(response.status).to eq(200)
    end

    it 'Delete Api' do
      delete "/api/v1/users/#{@user.id}"
      expect(response.status).to eq(200)
    end

    it 'Update Api' do
      put "/api/v1/users/#{@user.id}", params: { user: { email: 'aadi@gmail.com', password: 'aadi1234' } }
      expect(response.status).to eq(200)
    end
  end
end
