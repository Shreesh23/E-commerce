# frozen_string_literal: true
require 'csv'
class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :rating, inclusion: { in: 0..5 }, presence: { message: ' Must be within 0-5' }
  def self.to_csv
    posts = all
    CSV.generate do |csv|
      csv << column_names
      posts.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end
end
