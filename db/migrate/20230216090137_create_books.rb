# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :price
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
