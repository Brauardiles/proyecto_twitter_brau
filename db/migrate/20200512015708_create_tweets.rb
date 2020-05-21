class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :image_url
      t.integer :total_likes
      t.integer :total_retweet

      t.timestamps
    end
  end
end
