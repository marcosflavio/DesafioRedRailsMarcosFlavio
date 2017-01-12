class CreateRedweets < ActiveRecord::Migration
  def change
    create_table :redweets do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end