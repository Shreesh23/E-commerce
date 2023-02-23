# frozen_string_literal: true

class Cloth < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
