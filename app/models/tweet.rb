class Tweet < ApplicationRecord
  validates :content, presence: true
  has_many :likes
  has_many :retweets
  attribute :total_likes, :integer, default: 0
  attribute :total_retweet, :integer, default: 0

  paginates_per 50
end
