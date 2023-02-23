# frozen_string_literal: true
require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Api::V1::Items', type: :request do
  describe 'ITEMS API' do
    before do
      @item = create(:item)
    end

    it 'get/index' do
      get '/api/v1/items'
      expect(response).to be_successful
    end

    it 'Create Api' do
      post '/api/v1/items', params: { item: { name: 'bottle', price: 23, rating: 3 } }
      expect(response.status).to eq(200)
    end

    it 'Delete Api' do
      delete "/api/v1/items/#{@item.id}"
      expect(response.status).to eq(200)
    end

    it 'Update Api' do
      put "/api/v1/items/#{@item.id}", params: { item: { name: 'Watch', price: 50, rating: 3 } }
      expect(response.status).to eq(200)
    end
  end
end
