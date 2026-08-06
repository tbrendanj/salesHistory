class CreateSales < ActiveRecord::Migration[8.1]
  def change
    create_table :sales do |t|
      t.references :Product, null: false, foreign_key: true
      t.references :Quarter, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
