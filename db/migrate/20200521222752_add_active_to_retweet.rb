class AddActiveToRetweet < ActiveRecord::Migration[5.2]
  def change
    add_column :retweets, :active, :boolean, default: true
  end
end
