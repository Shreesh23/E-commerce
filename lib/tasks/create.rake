require 'csv'
namespace :create do
    desc "Product teams from csv file"
        task item: :environment do

            file = "public/csv/product2.csv"
            
            CSV.foreach(file, headers: :true) do |row|
                if row.to_h.has_value?(nil)!=true
                    Item.create!(row.to_hash)
                end
               
            end
    end
end