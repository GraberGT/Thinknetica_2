class DropTableTestHistories < ActiveRecord::Migration[6.0]
  def up
    drop_table :test_histories, if_exists: true
  end
end
