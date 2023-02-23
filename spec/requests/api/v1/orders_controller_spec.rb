# frozen_string_literal: true
require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Api::V1::Orders', type: :request do
  describe 'ORDERS API' do
    before do
      @order = create(:order)
    end
    it 'get/index' do
      get '/api/v1/orders'
      expect(response).to be_successful
    end

    it 'Create Api' do
      post '/api/v1/orders', params: { order: { name: 'bottle', total_price: 23 } }
      expect(response.status).to eq(200)
    end

    it 'Delete Api' do
      delete "/api/v1/orders/#{@order.id}"
      expect(response.status).to eq(200)
    end

    it 'Update Api' do
      put "/api/v1/orders/#{@order.id}", params: { order: { name: 'Watch', total_price: 50 } }
      expect(response.status).to eq(200)
    end
  end
end
