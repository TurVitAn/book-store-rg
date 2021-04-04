class AddPropertiesToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :price, :float
    add_column :books, :height, :float
    add_column :books, :width, :float
    add_column :books, :depth, :float
    add_column :books, :materials, :string, unique: true
    add_column :books, :published_at, :date
  end
end
