class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.string :rigth_answer, null: false
      t.references :questions, foreign_key: true, null: false

      t.timestamps
    end
  end
end
