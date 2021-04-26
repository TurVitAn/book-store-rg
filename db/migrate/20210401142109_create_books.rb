class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.float :price
      t.float :height
      t.float :width
      t.float :depth
      t.string :materials
      t.date :published_at
      t.references :category, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
