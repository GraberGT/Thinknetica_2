class RenameColumnToAnswers < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :rigth_answer, :right_answer
  end
end
