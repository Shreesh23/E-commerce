# frozen_string_literal: true
FactoryBot.define do
  factory :order do
    name { 'mouse' }
    total_price { 32 }
    user
  end
end
