# frozen_string_literal: true

require 'csv'
desc 'Product teams from csv file'
task product: [:environment] do
  file = 'public/csv/product.csv'

  CSV.foreach(file, headers: true) do |row|
    Item.create!(row.to_hash)
  end
end
