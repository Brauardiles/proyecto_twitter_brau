class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy

  attribute :image_url, :string, default: 'https://secure.gravatar.com/avatar/8d2ab8f62e9bf17a95aab0dd1c83811e?s=96&d=mm&r=g'
  # Active
  has_many :active_relationships, class_name:  "Relationship",
            foreign_key: "follower_id", dependent: :destroy
  # Passive
  has_many :passive_relationships, class_name:  "Relationship",
            foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
