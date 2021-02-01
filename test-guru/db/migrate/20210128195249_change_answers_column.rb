class ChangeAnswersColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :right_answer, :correct
  end
end
