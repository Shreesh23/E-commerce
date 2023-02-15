require 'csv'

class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates_length_of :rating, is: 5, message: 'Number must be 5 digit long'

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
