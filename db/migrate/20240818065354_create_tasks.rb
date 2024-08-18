class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :detail
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
