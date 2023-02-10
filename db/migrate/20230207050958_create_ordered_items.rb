class CreateOrderedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :ordered_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
