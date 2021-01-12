class CreateTestHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :test_histories do |t|
        t.references :test, null: false, foreign_key: true
        t.references :user, null: false, foreign_key: true
        t.boolean :passed
  
        t.timestamps
      
    end
    change_column_default(:test_histories, :passed, from: nil, to: false)
  end
end
