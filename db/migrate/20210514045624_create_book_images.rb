class CreateBookImages < ActiveRecord::Migration[6.1]
  def change
    create_table :book_images do |t|
      t.text :image_data
      t.references :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
