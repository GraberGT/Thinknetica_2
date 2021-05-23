class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :octicon, null: false
      t.string :user_id, null: true
      t.string :color, default: "black"
      t.string :rule, null: false
      t.string :rule_value
      t.index  :octicon, :color, unique: true
      t.index  :rule, :rule_value, unique:true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
