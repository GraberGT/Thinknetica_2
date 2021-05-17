class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.boolean :rigth_answer, null: false
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end
