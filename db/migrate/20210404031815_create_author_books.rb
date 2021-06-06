class CreateAuthorBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :author_books do |t|
      t.references :author, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
