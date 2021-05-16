class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
