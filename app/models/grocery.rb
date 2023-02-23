# frozen_string_literal: true

class Grocery < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
