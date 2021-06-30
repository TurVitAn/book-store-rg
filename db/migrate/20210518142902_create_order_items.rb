class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :book, foreign_key: true, index: true
      t.references :order, foreign_key: true, index: true

      t.timestamps
    end
  end
end
