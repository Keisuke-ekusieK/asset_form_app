class MonthlyExpense < ApplicationRecord
  belongs_to :user

	default_scope -> { order(year: :desc).order(month: :desc).order(created_at: :desc) }
	scope :search_by_keyword, -> (keyword) {
  	where("monthly_expenses.name LIKE :keyword", keyword: "%#{keyword}%") if keyword.present?
	}

	validates :year, presence: true,
									 numericality: { only_integer: true,
																	 greater_than_or_equal_to: 2010,
																	 less_than_or_equal_to: 2030}
	validates :month, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 1,
																		less_than_or_equal_to: 12 }
	validates :house, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :food, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :clothes, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :education, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :daily_necessities, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :car, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :medical_treatment, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :entertainment, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :communication, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :social, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :insurance, presence: true,
										numericality: { only_integer: true,
																		greater_than_or_equal_to: 0 }
	validates :comment, length: { maximum: 200 }
	validates :user_id, presence: true

	def sum
		self.house + self.food + self.clothes + self.education + self.daily_necessities + self.car + self.medical_treatment + self.entertainment + self.communication + self.social + self.insurance
	end

	def already_registered?
		!MonthlyExpense.find_by(year: self.year, month: self.month, user_id: self.user.id).nil?
	end
end
