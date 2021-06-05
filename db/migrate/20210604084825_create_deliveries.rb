class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :kind
      t.float :price
      t.integer :from_days
      t.integer :to_days

      t.timestamps
    end
  end
end
