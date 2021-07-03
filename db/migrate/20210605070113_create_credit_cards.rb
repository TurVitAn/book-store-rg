class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :cvv
      t.string :name
      t.string :date
      t.references :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
