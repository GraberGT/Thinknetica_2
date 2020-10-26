class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      add_reference :tests, :category, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
