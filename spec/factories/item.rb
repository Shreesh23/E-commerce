# frozen_string_literal: true
FactoryBot.define do
  factory :item do
    name { 'mouse' }
    price { 32 }
    rating { 2 }
    user
  end
end
