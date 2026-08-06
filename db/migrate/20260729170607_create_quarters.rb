class CreateQuarters < ActiveRecord::Migration[8.1]
  def change
    create_table :quarters do |t|
      t.integer :quarter_num, null: false
      t.integer :year, null: false

      t.timestamps
      t.index [ :quarter_num, :year ], unique: true
    end
  end
end
