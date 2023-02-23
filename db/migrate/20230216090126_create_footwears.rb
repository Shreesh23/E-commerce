# frozen_string_literal: true

class CreateFootwears < ActiveRecord::Migration[7.0]
  def change
    create_table :footwears do |t|
      t.string :name
      t.integer :price
      t.integer :rating
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
