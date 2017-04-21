class User < ActiveRecord::Base

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable

  include DeviseTokenAuth::Concerns::User
  
  # MAPPING

  has_many :posts

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # METHODS

  def self.list_followers user_id
    select('users.name , users.id')
    .joins(:followers)
    .where('relationships.follower_id': user_id)
  end

  def self.have_relationship? user_id , followed_id
    Relationship.where(follower_id: followed_id ,followed_id: user_id).any?
  end

end
