# frozen_string_literal: true

require 'csv'
namespace :create do
  desc 'Product teams from csv file'
  task item: :environment do
    file = 'public/csv/product2.csv'

    CSV.foreach(file, headers: true) do |row|
      Item.create!(row.to_hash) if row.to_h.value?('nil') != true
    end
  end
end
