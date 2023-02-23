# frozen_string_literal: true

class Beauty < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
