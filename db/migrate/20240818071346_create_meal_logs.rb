class CreateMealLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :meal_date, null: false
      t.string :meal_type, null: false
      t.string :food_name, null: false
      t.string :amount

      t.timestamps
    end
  end
end
