class Item < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    # validates_length_of :rating, is: 5,  message: "Number must be 5 digit long"  
end
