# frozen_string_literal: true

class Electronic < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
