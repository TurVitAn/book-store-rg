class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.integer :rating
      t.integer :status, null: false, default: 0
      t.boolean :is_verified, default: false
      t.references :user, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
