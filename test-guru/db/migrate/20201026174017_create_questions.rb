class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.integer :test_id, null: false

      t.timestamps
    end
  end
end
