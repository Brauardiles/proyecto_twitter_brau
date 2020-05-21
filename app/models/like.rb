class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def add_like
    tweet.update(total_likes: tweet.total_likes += 1)
  end

  def delete_like
    tweet.update(total_likes: tweet.total_likes -= 1)
  end
end
