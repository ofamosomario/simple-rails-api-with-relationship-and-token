class Post < ApplicationRecord

	# VALIDATIONS

	validates :message, presence: true, length: { maximum: 140 }


	# MAPPING

	belongs_to :user

	# METHODS

  def self.my_posts user_id
    select(:id , :message , 'users.name' , :created_at)
    .joins(:user)
    .where(user_id: user_id)
  end 

end
