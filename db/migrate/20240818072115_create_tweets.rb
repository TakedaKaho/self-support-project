class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tweet, null: false

      t.timestamps
    end
  end
end

