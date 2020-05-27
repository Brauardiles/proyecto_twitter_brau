class Tweet < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  validates :content, presence: true
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy
  attribute :total_likes, :integer, default: 0
  attribute :total_retweet, :integer, default: 0

  paginates_per 50

  after_create do
    tweet = Tweet.find_by(id: self.id)
    hashtag = self.content.scan(/#\w+/)
    hashtag.uniq.map do |h|
      tag = Tag.find_or_create_by(name: h.downcase.delete('#'))
      tweet.tags << tag
    end
  end

  scope :tweets_for_me, -> (user_ids) { where(user_id: user_ids)}
end
