class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.float :target_weight
      t.float :target_body_fat
      t.date :target_date

      t.timestamps
    end
  end
end
