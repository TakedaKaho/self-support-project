class CreateExerciseLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.date :exercise_date, null: false
      t.string :exercise_type, null: false
      t.integer :time, null: false
      t.string :notes

      t.timestamps
    end
  end
end

