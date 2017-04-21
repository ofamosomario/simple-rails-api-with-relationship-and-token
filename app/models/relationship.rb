class Relationship < ApplicationRecord

	# ENUMS

  enum status: 
  {
      pending:           1,
      accepted:          2,
      rejected:          3
  }

  # MAPPING

	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"

	# METHODS

	def self.already_following? follower_id , followed_id
		where(follower_id: follower_id , followed_id: followed_id).any?
	end

	def self.accept_friendship followed_id , follower_id
		where(follower_id: follower_id , followed_id: followed_id)
		.update_all(status: statuses[:accepted])
	end

	def self.reject_friendship followed_id , follower_id
		where(follower_id: follower_id , followed_id: followed_id)
		.update_all(status: statuses[:rejected])
	end

	def self.is_status_pending? following_id , followed_id , status
		where(follower_id: follower_id , followed_id: followed_id , status: status).any?
	end

end
