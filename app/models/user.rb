class User < ApplicationRecord
	has_one  :family,           dependent: :destroy
	has_one  :asset_allocation, dependent: :destroy

	scope :search_by_keyword, -> (keyword) {
    where("users.name LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
  }

	validates :name,  presence: true, 
										length: { in: 3..50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
										length: { maximum: 255 }, 
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	before_save :downcase_email

	VALID_USER_NAME_REGEX = /\A[a-z0-9_]+\z/i
	validates :user_name, presence: true, 
												length: { in: 5..15 }, 
												format: { with: VALID_USER_NAME_REGEX }, 
												uniqueness: { case_sensitive: false }
	before_save :downcase_user_name

	has_one_attached :avatar
	validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: "must be a valid image format" },
                     size:         { less_than: 5.megabytes,
                                     message: "should be less than 5MB" }

	has_secure_password
	validates :password, presence: true,
											 length: { minimum: 6 },
											 allow_nil: true

	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

	def resize_avatar
		self.avatar.variant(resize_to_limit: [150, 150])
	end

	# ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

	def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    MonthlyExpense.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

	private
		def downcase_email
			self.email.downcase!
		end

		def downcase_user_name
			self.user_name.downcase!
		end
end
