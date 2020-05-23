class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy
  attribute :total_likes, :integer, default: 0
  attribute :total_retweet, :integer, default: 0

  paginates_per 50

  scope :tweets_for_me, -> (user_ids) { where(user_id: user_ids)}
end
