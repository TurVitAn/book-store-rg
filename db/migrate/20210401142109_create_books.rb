class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.float :price
      t.float :height
      t.float :width
      t.float :depth
      t.string :materials
      t.date :published_at
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
