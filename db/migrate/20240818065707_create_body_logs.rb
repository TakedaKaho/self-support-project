class CreateBodyLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :body_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.float :weight
      t.float :body_fat
      t.date :recorded_at, null: false

      t.timestamps
    end
  end
end
