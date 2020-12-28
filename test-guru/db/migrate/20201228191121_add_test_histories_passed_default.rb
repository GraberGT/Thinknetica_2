class AddTestHistoriesPassedDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:test_histories, :passed, from: nil, to: false)
  end
end
