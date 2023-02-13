require 'csv'
class Item < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates_length_of :rating, is: 5,  message: "Number must be 5 digit long"  
    def self.to_csv
        items = all
        CSV.generate do |csv|
          csv << column_names
          items.each do |item|
            csv << item.attributes.values_at(*column_names)
          end
        end
    end
end
