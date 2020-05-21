class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def add_retweet
    tweet.update(total_retweet: tweet.total_retweet += 1)
  end

  def delete_retweet
    tweet.update(total_retweet: tweet.total_retweet -= 1)
  end
end
