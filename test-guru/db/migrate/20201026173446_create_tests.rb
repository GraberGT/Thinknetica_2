class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false
      add_reference :questions, :test, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
